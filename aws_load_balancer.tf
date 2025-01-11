# Creating External LoadBalancer
resource "aws_lb" "external_alb" {
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_server.id]
  subnets = var.public_subnet
}
resource "aws_lb_target_group" "target_elb" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}
resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.web_instance1.id
  port             = 80
depends_on = [
    aws_instance.web_instance1,
  ]
}
resource "aws_lb_target_group_attachment" "attachment2" {
  target_group_arn = aws_lb_target_group.target_elb.arn
  target_id        = aws_instance.web_instance2.id
  port             = 80
depends_on = [
    aws_instance.web_instance2,
  ]
}
resource "aws_lb_listener" "external_elb" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_elb.arn
  }
}
