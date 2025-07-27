variable "ami" {
  type    = string
  default = "ami-0a1235697f4afa8a4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "env" {
  type    = list(string)
  default = ["one","two","three"]
}
