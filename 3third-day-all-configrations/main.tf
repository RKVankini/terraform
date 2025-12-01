resource "aws_instance" "name" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "RKV"
    tags = {
      Name = "third day"
    }
}
