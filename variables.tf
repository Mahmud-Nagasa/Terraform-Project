variable "vpc_name" {
  type        = string
  description = "name of the vpc"
}
variable "vpc_cidr" {
  type        = string
  description = "vpc cidr range"
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}
variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "azs" {

  type        = list(string)
  description = "Availability Zones"
}

variable "sg_name" {
  type        = string
  description = "name for the securtiy group"
}

variable "ingress_rules" {
  type        = map(any)
  description = "Ingress security group rules"
}

variable "egress_rules" {
  type        = map(any)
  description = "Ingress security group rules"

}

variable "ami" {
  type        = string
  description = "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type (64-bit (x86))"
}

variable "instance_type" {
  type        = string
  description = "t2.micro, free tier"

}

variable "key" {
  type = string 
  description = "the name of the key used to ssh to the instance"
}
variable "alb_name" {
  type        = string
  description = "name of the application load balancer"

}

variable "target_group_name" {
  type        = string
  description = "name of the target group"

}

variable "desired_capacity" {
  type        = number
  description = "determine the desired number of instances"

}
variable "max_size" {
  type        = number
  description = "determine the maximum number of instances"
}

variable "min_size" {
  type        = number
  description = "determine the minimum number of instances"
}

variable "auto_scaling_group" {
  type        = bool
  description = "creates an auto scaling group"
}