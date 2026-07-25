 resource "aws_instance" "backend" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_name 
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo dnf install -y nodejs
              sudo npm install -g pm2
              yum install git -y
              dnf install mariadb105-server -y
              EOF
  tags = {
    Name = "backend-public"
  }
  }