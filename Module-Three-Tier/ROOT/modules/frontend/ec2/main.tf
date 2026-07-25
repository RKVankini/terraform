resource "aws_instance" "frontend" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name 
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              dnf install nodejs -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              yum install git -y
              EOF
  tags = {
    Name = "frontend-public"
  }

  }
