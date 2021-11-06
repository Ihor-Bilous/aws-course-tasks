resource "aws_lb_target_group" "week4-tg" {
  name     = "week4-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.week4-vpc.id

  health_check {
    protocol = "HTTP"
    path     = "/index.html"
  }
}

resource "aws_lb_target_group_attachment" "week4-public-tg-attachment" {
  target_group_arn = aws_lb_target_group.week4-tg.arn
  target_id        = aws_instance.public_ec2_instance.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "week4-private-tg-attachment" {
  target_group_arn = aws_lb_target_group.week4-tg.arn
  target_id        = aws_instance.private_ec2_instance.id
  port             = 80
}

resource "aws_lb" "week4-lb" {
  name               = "week4-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_http_sg.id]
  subnets            = [aws_subnet.public-week4-subnet.id, aws_subnet.private-week4-subnet.id]
}

resource "aws_alb_listener" "week4-lb_listener" {
  load_balancer_arn = aws_lb.week4-lb.arn
  port              = 80
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.week4-tg.arn
  }
}
