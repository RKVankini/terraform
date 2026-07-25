

# -----------------------
# Frontend AMI
# -----------------------
# data "aws_ami" "frontend" {
#   most_recent = true
#   owners      = ["self"]

#   filter {
#     name   = "name"
#     values = [var.frontend_ami]
#   }
# }

resource "aws_ami_from_instance" "ami_frontend" {
  name               = "frontend-ami"
  source_instance_id = var.instanceid
  snapshot_without_reboot = false

  tags = {
    Name = "fronntend-ami"
  }
}

# -----------------------
# Frontend Launch Template
# -----------------------
resource "aws_launch_template" "frontend" {
  name                   = "${var.project_name}-frontend-lt"
  description            = "Frontend launch template"
  image_id               = aws_ami_from_instance.ami_frontend.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.frontend_sg_id]
  key_name               = var.key_name
  update_default_version = true

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-frontend"
    }
  }
}


