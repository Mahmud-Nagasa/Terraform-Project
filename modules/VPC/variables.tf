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
