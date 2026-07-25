
#######################
# BACKEND ASG
#######################
resource "aws_autoscaling_group" "backend" {
  name_prefix          = "${var.project_name}-backend-asg"
  desired_capacity     = var.backend_desired_capacity
  min_size             = var.backend_min_size
  max_size             = var.backend_max_size
  vpc_zone_identifier  = [var.app_subnet_1_id, var.app_subnet_2_id]
  target_group_arns    = [var.backend_target_group_arn]
  health_check_type    = "EC2"

  launch_template {
    id      = var.backend_launch_template_id
    version = "$Latest"
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["desired_capacity"]
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-backend-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "backend_scale_out" {
  name                   = "${var.project_name}-backend-scale-out"
  autoscaling_group_name = aws_autoscaling_group.backend.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = var.scale_out_target_value
    disable_scale_in = false
  }
}
