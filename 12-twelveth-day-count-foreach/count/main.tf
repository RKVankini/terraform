############### Example-1 name with count #############
# resource "aws_instance" "name" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   count         = var.instance_count

#   tags = {
#     Name = "${var.name_prefix}-${count.index}"
#   }
# }

############################### Example-2 Different names #############
# resource "aws_instance" "name2" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   count         = length(var.env)

#   tags = {
#     Name = var.env[count.index]
#   }
# }
