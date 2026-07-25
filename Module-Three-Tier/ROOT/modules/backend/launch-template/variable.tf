variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "three-tier"
}


# variable "backend_ami" {
#   description = "Backend AMI name pattern"
#   type        = string
# }

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "backend_sg_id" {
  description = "Backend Security Group ID"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "instanceid" {
  description = "Source instance ID for creating AMI"
  type        = string
}