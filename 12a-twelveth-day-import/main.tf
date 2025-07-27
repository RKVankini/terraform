resource "aws_instance" "name" {
    ami = "ami-0d0ad8bb301edb745"
    instance_type = "t2.micro"
    key_name = "RKV"
    tags = {
        Name = "RK-terra"
    }
  
}