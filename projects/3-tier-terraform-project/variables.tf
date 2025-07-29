## VPC ##
variable "aws_region" {
  default = "ap-south-1"   # Mumbai region
}

variable "name_prefix" {
  default = "rk-3tier"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

## ASG ##

variable "ami_id" {
  default = "ami-0f918f7e67a3323f0"   # Ubuntu 22.04 LTS - Mumbai
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "RKV"           # Replace with your key pair
}

## rds ##

variable "db_name" {}
variable "db_username" {}
variable "db_password" {
  sensitive = true
}
variable "db_instance_class" {}

