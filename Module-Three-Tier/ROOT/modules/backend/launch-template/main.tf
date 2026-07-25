
# -----------------------
# Backend AMI
# -----------------------
# data "aws_ami" "backend" {
#   most_recent = true
#   owners      = ["self"]

#   filter {
#     name   = "name"
#     values = [var.backend_ami]
#   }
# }

resource "aws_ami_from_instance" "ami_backend" {
  name               = "backend-ami"
  source_instance_id = var.instanceid
  snapshot_without_reboot = false

  tags = {
    Name = "backend-ami"
  }
}

# -----------------------
# Backend Launch Template
# -----------------------
resource "aws_launch_template" "backend" {
  name                   = "${var.project_name}-backend-lt"
  description            = "Backend launch template"
  image_id               = aws_ami_from_instance.ami_backend.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.backend_sg_id]
  key_name               = var.key_name
  update_default_version = true

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project_name}-backend"
    }
  }
  depends_on = [ aws_ami_from_instance.ami_backend ]
}
