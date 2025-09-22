# variable "create_bucket" {
#     description = "set to true to create the s3 bucket"
#     type = bool
#     default = true
  
# }

###=== Example-2 ===###
# variable "aws_region" {
#   description = "The region in which to create the infrastructure"
#   type        = string
#   default     = "ap-south-1"

#   validation {
#     condition     = var.aws_region == "ap-south-1" || var.aws_region == "us-east-1"
#     error_message = "The variable 'aws_region' must be one of the following regions: ap-south-1, us-east-1"
#   }
# }

###=== Example-3 ===###
#With a numeric condition, in this setup, the EC2 instance will only be created if the instance type is t2.micro (i.e., count = var.instance_type == "t2.micro" ? 1 : 0).

variable "ami" {
  type    = string
  default = "ami-0a1235697f4afa8a4" # Replace with latest AMI in your region if needed
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
 
