output "vpc_id" {
  description = "id of the project vpc"
  value       = aws_vpc.main.id
}
output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}