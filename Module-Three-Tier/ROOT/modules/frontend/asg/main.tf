
#######################
# FRONTEND ASG
#######################
resource "aws_autoscaling_group" "frontend" {
  name_prefix          = "${var.project_name}-frontend-asg"
  desired_capacity     = var.frontend_desired_capacity
  max_size             = var.frontend_max_size
  min_size             = var.frontend_min_size
  vpc_zone_identifier  = [var.web_subnet_1_id, var.web_subnet_2_id]
  target_group_arns    = [var.frontend_target_group_arn]
  health_check_type    = "EC2"

  launch_template {
    id      = var.frontend_launch_template_id
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
    value               = "${var.project_name}-frontend-asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "frontend_scale_out" {
  name                   = "${var.project_name}-frontend-scale-out"
  autoscaling_group_name = aws_autoscaling_group.frontend.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value     = var.scale_out_target_value
    disable_scale_in = false
  }
}

