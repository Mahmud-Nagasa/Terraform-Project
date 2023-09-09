resource "aws_alb" "alb" {
  internal           = false
  load_balancer_type = "application"
  name               = var.alb_name
  security_groups    = [var.vpc_security_group_id]
  subnets            = var.public_subnets_ids
  tags = {
    Name = var.alb_name
  }
}

resource "aws_alb_target_group" "group" {
  name        = var.target_group_name
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id


  health_check {
    path = "/"
    port = 80
  }
}

resource "aws_lb_target_group_attachment" "example" {
  count            = var.auto_scaling_group == true ? 0 : length(var.aws_instance_ids)
  target_group_arn = aws_alb_target_group.group.arn
  target_id        = element(var.aws_instance_ids, count.index)
  port             = 80
}

resource "aws_alb_listener" "listener_http" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.group.arn
    type             = "forward"
  }
}


