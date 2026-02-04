resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "revision"
    }
  
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "pub-subnet"
    }
  
}

resource "aws_subnet" "name1" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "pvt-sub"
    }
}

resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
      Name = "revision_ig"
    }
}

resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
  }
  tags = {
    Name = "pub-rt"
  }
}


resource "aws_route_table" "name1" {
  vpc_id = aws_vpc.name.id
   route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.name.id
  }
  tags = {
    Name = "pvt-rt"
  }
}


resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}

resource "aws_route_table_association" "name1" {
    subnet_id = aws_subnet.name1.id
    route_table_id = aws_route_table.name1.id
}

resource "aws_security_group" "allow_tls" {
    name ="allow_tls"
    vpc_id = aws_vpc.name.id
    tags = {
      Name="revision_sg"
    }
ingress  {
        description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #all protocols 
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

resource "aws_eip" "name" {
    tags ={
        Name ="nat-eip"
    }
}

resource "aws_nat_gateway" "name" {
    allocation_id = aws_eip.name.id
    subnet_id = aws_subnet.name.id
    tags = {
      Name="nat-gw"
    }
}

resource "aws_instance" "name" {
    ami = "ami-0a1235697f4afa8a4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    key_name = "RKV"
    tags = {
      Name = "revision-pub"
    }
}

resource "aws_instance" "name1pvt" {
    ami = "ami-0a1235697f4afa8a4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name1.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    key_name = "RKV"
    tags = {
      Name="revision-pvt"
    }
  
}