variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "db_identifier" {
  description = "Unique name of the RDS instance"
  type        = string
}

variable "db_engine" {
  description = "The database engine to use (e.g., mysql)"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance type (e.g., db.t3.micro)"
  type        = string
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Initial database name to create"
  type        = string
}

variable "allocated_storage" {
  description = "Allocated storage for RDS (in GB)"
  type        = number
}

variable "sql_file_path" {
  description = "Path to the local SQL file to run on DB"
  type        = string
}
