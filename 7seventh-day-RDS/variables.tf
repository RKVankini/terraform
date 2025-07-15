variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for subnet 1"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for subnet 2"
  type        = string
}

variable "subnet1_az" {
  description = "Availability zone for subnet 1"
  type        = string
}

variable "subnet2_az" {
  description = "Availability zone for subnet 2"
  type        = string
}

variable "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  type        = string
}

variable "db_identifier" {
  description = "Unique RDS identifier"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_engine" {
  description = "Database engine"
  type        = string
}

variable "db_engine_version" {
  description = "Database engine version"
  type        = string
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "Name of the DB parameter group"
  type        = string
}

variable "allocated_storage" {
  description = "Storage allocated in GB"
  type        = number
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
}

variable "backup_window" {
  description = "Backup window in UTC (hh:mm-hh:mm)"
  type        = string
}

variable "maintenance_window" {
  description = "Maintenance window in UTC (ddd:hh:mm-ddd:hh:mm)"
  type        = string
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot on deletion"
  type        = bool
}

variable "secret_name" {
  description = "Name of the Secrets Manager secret"
  type        = string
}

variable "db_port" {
  description = "Database port number"
  type        = number
}
