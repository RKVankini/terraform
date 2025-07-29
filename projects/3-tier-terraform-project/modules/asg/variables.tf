variable "name_prefix" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "instance_sg_id" {}
variable "user_data" {
  type = string
}
variable "min_size" {
  default = 1
}
variable "max_size" {
  default = 3
}
variable "desired_capacity" {
  default = 2
}
