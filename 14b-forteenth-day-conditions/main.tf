# resource "aws_s3_bucket" "name" {
#     count = var.create_bucket ? 1 : 0
#     bucket = "rk-conditional-bucket"

#     tags = {
#       Name ="rk-conditional-bucket"
#       Environment ="rkdev"
#     }
  
# }

# resource "aws_s3_bucket_acl" "bucket_acl" {
#   count  = var.create_bucket ? 1 : 0
#   bucket = aws_s3_bucket.name[0].id
#   acl    = "private"
# }

###=== Example-2 ===###
# resource "aws_s3_bucket" "rktest" {
#     bucket = "rk-conditional-bucket"

#     tags = {
#       Name ="rk-conditional-bucket"
#       Environment ="rkdev"
#     }
  
# }

###=== Example-3 ===###

resource "aws_instance" "dev" {
  count         = var.instance_type == "t2.micro" ? 1 : 0
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "conditional-EC2"
  }
}
