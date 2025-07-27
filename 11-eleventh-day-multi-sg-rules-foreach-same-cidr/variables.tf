variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
}

variable "ingress_ports" {
  description = "List of ingress ports to allow"
  type        = list(number)
}

variable "cidr_blocks_ingress" {
  description = "CIDR blocks allowed for ingress"
  type        = list(string)
}

variable "cidr_blocks_egress" {
  description = "CIDR blocks allowed for egress"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the security group"
  type        = map(string)
}
