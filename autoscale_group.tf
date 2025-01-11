resource "aws_autoscaling_group" "autoscaling" {
  desired_capacity          = 2
  max_size                  = 5
  min_size                  = 1
  health_check_type         = "ELB"
  health_check_grace_period = 300
  launch_configuration      = aws_launch_template.launch_config.id
  vpc_zone_identifier       = var.public_subnet

  tag {
    key = "Name"
    value = "autoscalling_group"
    propagate_at_launch = true
  }
}