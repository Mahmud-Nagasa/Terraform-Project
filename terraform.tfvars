
vpc_cidr             = "10.0.0.0/16"
vpc_name             = "project_vpc"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
azs                  = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

sg_name = "Project security group"

ingress_rules = {
  "1" = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP ingress"
    }, "2" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS ingress"
} }

egress_rules = {
  "1" = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP ingress"
    }, "2" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS ingress"
} }

ami = "ami-007ec828a062d87a5"

instance_type = "t2.micro"

key = "projectkey"
alb_name = "terraform-project-alb"

target_group_name = "project-target-group"

desired_capacity = 3

max_size = 5

min_size = 3

auto_scaling_group = true 

