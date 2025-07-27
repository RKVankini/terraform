# Create a key pair from your public key file
resource "aws_key_pair" "example" {
  key_name   = var.key_name                   # Name of the key pair
  public_key = file(var.public_key_path)     # Load public key from file
}

# Create a Virtual Private Cloud (VPC)
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr         # IP range for VPC
  enable_dns_support   = true                 # Enable DNS resolution
  enable_dns_hostnames = true                 # Enable public DNS hostnames

  tags = {
    Name = "RK-terra-VPC"                     # Tag for easy identification
  }
}

# Create a public subnet inside the VPC
resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id  # Attach to the created VPC
  cidr_block              = var.subnet_cidr   # IP range for subnet
  availability_zone       = var.az            # Use Mumbai AZ (e.g., ap-south-1a)
  map_public_ip_on_launch = true              # Automatically assign public IP

  tags = {
    Name = "RK-terra-PublicSubnet"
  }
}

# Create an Internet Gateway to enable internet access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id                  # Attach to the VPC

  tags = {
    Name = "RK-terra-IGW"
  }
}

# Create a route table for the VPC
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id                  # Attach to the VPC

  route {
    cidr_block = "0.0.0.0/0"                 # All traffic
    gateway_id = aws_internet_gateway.igw.id # Send traffic to IGW
  }

  tags = {
    Name = "RK-terra-RouteTable"
  }
}

# Associate the route table with the public subnet
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.sub1.id        # Link to the public subnet
  route_table_id = aws_route_table.RT.id     # Use our internet-enabled route table
}

# Create a security group to allow SSH and HTTP
resource "aws_security_group" "webSg" {
  name   = "RK-terra-webSG"                  # Security group name
  vpc_id = aws_vpc.myvpc.id                  # Attach to our VPC

  ingress {
    description = "Allow HTTP"
    from_port   = 80                         # HTTP port
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              # Open to all
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22                         # SSH port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              # Open to all (for simplicity)
  }

  egress {
    from_port   = 0                          # Allow all outbound
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RK-terra-WebSG"
  }
}

# Launch an EC2 Ubuntu instance
resource "aws_instance" "server" {
  ami                         = var.ami_id                 # Ubuntu AMI for Mumbai
  instance_type               = var.instance_type          # t2.micro (Free Tier)
  key_name                    = aws_key_pair.example.key_name
  subnet_id                   = aws_subnet.sub1.id
  vpc_security_group_ids      = [aws_security_group.webSg.id]
  associate_public_ip_address = true                       # So we can SSH in

  tags = {
    Name = "RK-terra-UbuntuServer"
  }

  # Configure SSH connection
  connection {
    type        = "ssh"
    user        = "ubuntu"                               # Default for Ubuntu AMIs
    private_key = file(var.private_key_path)             # Use your private key
    host        = self.public_ip                         # Connect using public IP
    timeout     = "2m"
  }

  # Copy a local file to the EC2 instance
  provisioner "file" {
    source      = "file-RK"                               # Local file
    destination = "/home/ubuntu/file10"                  # Destination on instance
  }

  # Optional remote commands
  provisioner "remote-exec" {
    inline = [
      "touch /home/ubuntu/file200",
      "echo 'hello from RK terraform provisioners practice' >> /home/ubuntu/file200"
    ]
  }

  # Optional local command on your machine
  provisioner "local-exec" {
    command = "touch file500"
  }

  # ✅ Local command run on your own system
#   provisioner "local-exec" {
#     command = "echo 'Created by Terraform' > file500"
#   }

}

# Separate null resource to always re-run remote exec
# resource "null_resource" "run_script" {
#   provisioner "remote-exec" {
#     connection {
#       host        = aws_instance.server.public_ip
#       user        = "ubuntu"
#       private_key = file(var.private_key_path)
#     }

#     inline = [
#       "echo 'hello from RK terraform provisioners practice' >> /home/ubuntu/file200"
#     ]
#   }

#   triggers = {
#     always_run = timestamp() # Force this to run on every apply
#   }
#}


# Key Pair
# resource "aws_key_pair" "example" {
#   key_name   = "task"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

# VPC
# resource "aws_vpc" "myvpc" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_support   = true
#   enable_dns_hostnames = true

#   tags = {
#     Name = "MyVPC"
#   }
# }

# Subnet
# resource "aws_subnet" "sub1" {
#   vpc_id                  = aws_vpc.myvpc.id
#   cidr_block              = "10.0.0.0/24"
#   availability_zone       = "us-east-1a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "PublicSubnet"
#   }
# }

# Internet Gateway
# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.myvpc.id
# }

# Route Table
# resource "aws_route_table" "RT" {
#   vpc_id = aws_vpc.myvpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }

# Associate Route Table
# resource "aws_route_table_association" "rta1" {
#   subnet_id      = aws_subnet.sub1.id
#   route_table_id = aws_route_table.RT.id
# }

# Security Group
# resource "aws_security_group" "webSg" {
#   name   = "web"
#   vpc_id = aws_vpc.myvpc.id

#   ingress {
#     description = "Allow HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Allow SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# # EC2 Instance (Ubuntu)
# resource "aws_instance" "server" {
#   ami                         = "ami-0261755bbcb8c4a84" # Ubuntu AMI
#   instance_type               = "t2.micro"
#   key_name                    = aws_key_pair.example.key_name
#   subnet_id                   = aws_subnet.sub1.id
#   vpc_security_group_ids      = [aws_security_group.webSg.id]
#   associate_public_ip_address = true

#   tags = {
#     Name = "UbuntuServer"
#   }

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"                          # ✅ Correct for Ubuntu AMIs
#     private_key = file("~/.ssh/id_rsa")             # Path to private key
#     host        = self.public_ip
#     timeout     = "2m"
#   }

#   provisioner "file" {
#     source      = "file10"
#     destination = "/home/ubuntu/file10"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "touch /home/ubuntu/file200",
#       "echo 'hello from awsss' >> /home/ubuntu/file200"
#     ]
#   }
#    provisioner "local-exec" {
#     command = "touch file500" 
   
#  }
#  }
# resource "null_resource" "run_script" {
#   provisioner "remote-exec" {
#     connection {
#       host        = aws_instance.server.public_ip
#       user        = "ubuntu"
#       private_key = file("~/.ssh/id_rsa")
#     }

#     inline = [
#       "echo 'hello from awsdevops' >> /home/ubuntu/file200"
#     ]
#   }

#   triggers = {
#     always_run = "${timestamp()}" # Forces rerun every time
#   }
# }


#Solution-2 to Re-Run the Provisioner
#Use terraform taint to manually mark the resource for recreation:
# terraform taint aws_instance.server
# terraform apply