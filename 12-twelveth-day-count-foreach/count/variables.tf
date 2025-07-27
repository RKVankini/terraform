############### Example-1 name with count #############
# variable "ami_id" {
#   description = "AMI ID to launch the EC2 instances"
#   type        = string
#   default     = "ami-0a1235697f4afa8a4"
# }

# variable "instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# variable "instance_count" {
#   description = "Number of EC2 instances to create"
#   type        = number
#   default     = 2
# }

# variable "name_prefix" {
#   description = "Prefix for instance name tags"
#   type        = string
#   default     = "RK-terra"
# }

# ################## Example-2 Different names #############
# variable "env" {
#   description = "List of environment names to launch EC2 instances for"
#   type        = list(string)
#   default     = ["dev", "prod"]
# }

# variable "ami_id" {
#   description = "AMI ID to use for the EC2 instances"
#   type        = string
#   default     = "ami-0a1235697f4afa8a4"
# }

# variable "instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# #example-3 creating IAM users 
# # variable "user_names" {
# #   description = "IAM usernames"
# #   type        = list(string)
# #   default     = ["user1", "user2", "user3"]
# # }
# # resource "aws_iam_user" "example" {
# #   count = length(var.user_names)
# #   name  = var.user_names[count.index]
# # }