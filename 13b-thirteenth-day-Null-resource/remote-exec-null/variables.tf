variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "name_prefix" {
  description = "Resource name prefix"
  default     = "RK-terra"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "ami" {
  description = "AMI for EC2 (Ubuntu)"
  default     = "ami-0261755bbcb8c4a84" # Ubuntu AMI Mumbai
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for EC2"
  default     = "my-key"
}

variable "private_key_path" {
  description = "Path to private key file"
  default     = "~/.ssh/my-key.pem"
}
