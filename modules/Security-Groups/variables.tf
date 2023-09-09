variable "vpc_id" {
  type        = string
  description = "the id for project vpc"
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


