# VPC Setup
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "~> 5.1"

  name = "${var.name_prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true # Needed to allow private RDS to pull from Secrets Manager
  single_nat_gateway = true

  tags = {
    Name = "${var.name_prefix}-vpc"
  }
}

# Security Group for EC2 and RDS (internal access only)
resource "aws_security_group" "rk_sg" {
  name        = "${var.name_prefix}-sg"
  description = "Allow internal access"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 3306 # MySQL
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = module.vpc.public_subnets_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}-sg"
  }
}

# EC2 Instance (SQL Runner)
resource "aws_instance" "sql_runner" {
  ami                         = var.ami # Ubuntu AMI
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.rk_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "${var.name_prefix}-sql-runner"
  }
}

# Secrets Manager Secret
resource "aws_secretsmanager_secret" "rds_secret" {
  name = "${var.name_prefix}-rds-secret"
}

resource "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = "adminuser",
    password = "Admin@12345"
  })
}

# RDS (Private)
resource "aws_db_instance" "mysql_rds" {
  identifier             = "${var.name_prefix}-mysql"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.rk_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rk_sg.id]
  username               = jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["username"]
  password               = jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]
  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = "${var.name_prefix}-mysql"
  }
}

resource "aws_db_subnet_group" "rk_subnet_group" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "${var.name_prefix}-db-subnet-group"
  }
}

# Upload & Run SQL via EC2
resource "null_resource" "remote_sql_exec" {
  depends_on = [aws_instance.sql_runner, aws_db_instance.mysql_rds]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = aws_instance.sql_runner.public_ip
  }

  provisioner "file" {
    source      = "init.sql"
    destination = "/tmp/init.sql"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update && sudo apt install -y mysql-client",
      "mysql -h ${aws_db_instance.mysql_rds.address} -u ${jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["username"]} -p${jsondecode(aws_secretsmanager_secret_version.rds_secret_value.secret_string)["password"]} < /tmp/init.sql"
    ]
  }

  triggers = {
    always_run = timestamp()
  }
}
