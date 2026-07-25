output "frontend_asg_name" {
  value = aws_autoscaling_group.frontend.name
}



# output "frontend_tg_arn" {
#   value = aws_lb_target_group.front_end.arn
# }

# output "backend_tg_arn" {
#   value = aws_lb_target_group.back_end.arn
# }
