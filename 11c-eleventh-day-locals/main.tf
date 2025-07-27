locals {
  region        = "ap-south-1"
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0a1235697f4afa8a4"
  instance_type = local.instance_type
  tags = {
    Name = "App-${local.region}"
  }
}