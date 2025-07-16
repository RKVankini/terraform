# Step 1: Get the manually created secret
data "aws_secretsmanager_secret" "db_secret" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}

# Step 2: VPC and Subnets
resource "aws_vpc" "rds_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "rds-vpc"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  tags = {
    Name = "rds-subnet-group"
  }
}

# Step 3: Security Group
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow MySQL traffic"
  vpc_id      = aws_vpc.rds_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Restrict in production!
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Step 4: RDS Instance
resource "aws_db_instance" "rds_instance" {
  identifier              = "rds-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name

  username = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["username"]
  password = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["password"]

  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = false

  depends_on = [aws_db_subnet_group.rds_subnet_group]
}
