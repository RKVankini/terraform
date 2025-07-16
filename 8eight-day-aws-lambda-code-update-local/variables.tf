variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "project_prefix" {
  description = "Prefix for all resource names"
  type        = string
  default     = "RK-terra"
}

variable "lambda_zip" {
  description = "Path to Lambda deployment package"
  type        = string
  default     = "lambda_function.zip"
}
