variable "alb_name" {
  type        = string
  description = "name of the application load balancer"

}

variable "vpc_security_group_id" {
  type        = string
  description = "security group module id"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "list of the vpc module pulic subnets"
}

variable "target_group_name" {
  type        = string
  description = "name of the target group"

}

variable "vpc_id" {
  type        = string
  description = "the project vpc id"

}

variable "aws_instance_ids" {
  type        = list(string)
  description = "the ids of the EC2 instances"
}

variable "auto_scaling_group" {
  type        = bool
  description = "creates an auto scaling group"
}