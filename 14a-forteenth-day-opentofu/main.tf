resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="opentofu"
    }
  
}

resource "aws_subnet" "name" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.name.id
  
}

resource "aws_instance" "name" {
    ami = "ami-0a1235697f4afa8a4"
    instance_type = "t2.micro"
    key_name = "RKV"
    subnet_id = aws_subnet.name.id
    tags = {
      Name = "opentofu"
    }
  
}

# winget install --exact --id=OpenTofu.Tofu ====>> run this to install opentofu 
# tofu -version ===>> to check tofu version