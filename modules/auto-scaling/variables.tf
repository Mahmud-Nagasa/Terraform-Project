variable "ami" {
  type        = string
  description = "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type (64-bit (x86))"
}

variable "instance_type" {
  type        = string
  description = "t2.micro, free tier"

}

variable "user_data" {
  type = string


}

variable "vpc_security_group_id" {
  type        = string
  description = "security group module id"
}

variable "key" {
  type        = string
  description = "the name of the key pair"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "list of the vpc module pulic subnets"
}

variable "target_group_arn" {
  type        = string
  description = "the arn of the target group with EC2 instances"

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




