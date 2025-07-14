resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "RKV"
    tags = {
      Name = "fourth day"
    }
  
}

resource "aws_s3_bucket" "name" {
  bucket = "ramakrishnajadvhbhdadgv"
}