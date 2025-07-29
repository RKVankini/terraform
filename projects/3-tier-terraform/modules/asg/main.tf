resource "aws_launch_template" "app" {
  name_prefix   = "${var.name_prefix}-lt-"
  image_id      = var.ami_id                     # Ubuntu AMI for Mumbai
  instance_type = var.instance_type              # e.g., t2.micro

  key_name = var.key_name                        # EC2 key pair

  network_interfaces {
    associate_public_ip_address = false          # No public IP — private subnet only
    security_groups             = [var.instance_sg_id]
  }

  user_data = base64encode(var.user_data)        # Install app via script

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.name_prefix}-ec2"
    }
  }
}

resource "aws_autoscaling_group" "app" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.private_subnet_ids   # Launch EC2s in private subnets
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }


  health_check_type         = "EC2"
  health_check_grace_period = 60

  tag {
    key                 = "Name"
    value               = "${var.name_prefix}-ec2"
    propagate_at_launch = true
  }

  depends_on = [aws_launch_template.app]
}
