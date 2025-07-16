variable "secret_name" {
  description = "The name of the existing Secrets Manager secret"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "somedb"
}
