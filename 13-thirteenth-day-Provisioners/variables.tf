# Region to deploy resources
variable "aws_region" {
  type    = string
  default = "" # Mumbai region
}

# Ubuntu AMI ID for Mumbai region
variable "ami_id" {
  type    = string
  default = "" # Ubuntu 22.04 LTS for ap-south-1
}

# EC2 instance type
variable "instance_type" {
  type    = string
  default = "" # Free tier eligible instance
}

# CIDR block for the VPC
variable "vpc_cidr" {
  type    = string
  default = "" # Entire private IP space for VPC
}

# CIDR block for the public subnet
variable "subnet_cidr" {
  type    = string
  default = "" # Smaller subnet inside VPC
}

# Availability Zone inside ap-south-1 region
variable "az" {
  type    = string
  default = "" # You can also use 1b or 1c
}

# Key pair name used to SSH into EC2
variable "key_name" {
  type    = string
  default = "" # Your AWS key pair name
}

# Path to your local public key
variable "public_key_path" {
  type    = string
  default = "" # Public key to upload to AWS
}

# Path to your local private key
variable "private_key_path" {
  type    = string
  default = "" # Used for provisioning SSH
}
