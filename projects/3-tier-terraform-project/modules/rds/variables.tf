variable "name_prefix" {
  description = "Prefix for naming RDS resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for RDS subnet group"
  type        = list(string)
}

variable "db_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Master username"
  type        = string
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Instance type for RDS"
  type        = string
}
