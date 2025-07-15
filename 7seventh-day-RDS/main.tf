locals {
  rds_credentials = {
    username = var.db_username
    password = var.db_password
  }
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name        = var.secret_name
  description = "RDS credentials for ${var.db_identifier} instance"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = local.rds_credentials.username
    password = local.rds_credentials.password
    engine   = var.db_engine
    dbname   = var.db_name
    port     = var.db_port
  })
}

resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = var.subnet1_cidr
  availability_zone = var.subnet1_az
}

resource "aws_subnet" "subnet-2" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = var.subnet2_cidr
  availability_zone = var.subnet2_az
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.subnet-1.id, aws_subnet.subnet-2.id]

  tags = {
    Name = "RK-terra subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage       = var.allocated_storage
  identifier              = var.db_identifier
  db_name                 = var.db_name
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.instance_class
  username                = local.rds_credentials.username
  password                = local.rds_credentials.password
  db_subnet_group_name    = aws_db_subnet_group.sub-grp.name
  parameter_group_name    = var.parameter_group_name
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window
  deletion_protection     = false #If we keep it true we cant destroy it from here
  skip_final_snapshot     = var.skip_final_snapshot

  depends_on = [aws_db_subnet_group.sub-grp]
}
