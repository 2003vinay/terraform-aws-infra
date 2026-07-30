resource "aws_lb" "alb" {
  name               = "terraform-alb-${terraform.workspace}"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.security_group_id]
  subnets         = var.subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = "terraform-alb-${terraform.workspace}"
    }
  )
}


resource "aws_lb_target_group" "tg" {
  name     = "terraform-tg-${terraform.workspace}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(
    var.common_tags,
    {
      Name = "terraform-tg-${terraform.workspace}"
    }
  )
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

