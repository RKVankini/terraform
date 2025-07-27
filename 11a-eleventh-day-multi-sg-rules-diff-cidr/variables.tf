variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources in"
}

variable "allowed_ports" {
  type = map(string)
  description = "Map of port numbers to allowed CIDR blocks"
}
