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
variable "vpc_security_group_id" {
  type        = string
  description = "security group module id"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "list of the vpc module pulic subnets"
}

variable "user_data" {
  type = string

}

variable "auto_scaling_group" {
  type        = bool
  description = "creates an auto scaling group"
}