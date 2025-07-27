resource "aws_instance" "name" {
    ami = "ami-0a1235697f4afa8a4"
    instance_type = "t2.micro"
    user_data = file("test.sh")
    tags = {
      Name = "Rk-terra-userdata"
    }
   
}