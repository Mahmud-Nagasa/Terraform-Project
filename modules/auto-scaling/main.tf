resource "aws_launch_template" "nginx_instances" {
  name_prefix   = "nginx_instances"
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = base64encode(var.user_data)
  key_name      = var.key
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.vpc_security_group_id]
  }
}

resource "aws_autoscaling_group" "nginx_instances" {
  count               = var.auto_scaling_group == true ? 1 : 0
  vpc_zone_identifier = var.public_subnets_ids
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  launch_template {
    id      = aws_launch_template.nginx_instances.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "EC2-nginx"
    propagate_at_launch = true
  }
  target_group_arns = [var.target_group_arn]
}