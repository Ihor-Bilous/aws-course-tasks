resource "aws_lb_target_group" "lb_target_group" {
  name     = "week4-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol = "HTTP"
    path     = "/actuator/health"
  }
}

resource "aws_lb" "load_balancer" {
  name               = "edu-load-balancer"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_sg.id]
  subnets            = var.public_subnets_ids
}

resource "aws_alb_listener" "week4-lb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}
