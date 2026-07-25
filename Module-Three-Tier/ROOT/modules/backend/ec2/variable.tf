variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "" 
  
}
variable "ami" {
  description = "AMI ID for the bastion host"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the bastion host"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Public subnet ID where the bastion will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the bastion host"
  type        = string
}