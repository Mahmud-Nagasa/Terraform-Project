output "instance_ids" {
  value = aws_instance.EC2[*].id
}