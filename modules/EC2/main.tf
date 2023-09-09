resource "aws_instance" "EC2" {
  count                       = var.auto_scaling_group == true ? 0 : length(var.public_subnets_ids)
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.vpc_security_group_id]
  subnet_id                   = element(var.public_subnets_ids, count.index)
  key_name                    = var.key
  tags = {
    Name = "EC2-${1 + count.index}"
  }
  user_data = var.user_data
}
