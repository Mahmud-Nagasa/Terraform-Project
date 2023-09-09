module "vpc" {
  source               = "./modules/VPC"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  vpc_name             = var.vpc_name
}

module "Security_group" {
  source        = "./modules/Security-Groups"
  vpc_id        = module.vpc.vpc_id
  sg_name       = var.sg_name
  ingress_rules = var.ingress_rules
  egress_rules  = var.egress_rules
}

module "EC2" {
  source                = "./modules/EC2"
  ami                   = var.ami
  instance_type         = var.instance_type
  key                   = var.key
  user_data             = file("/home/mahmoud/northcoders/cloud/ce-terraform-project/modules/EC2/userdata.tpl")
  vpc_security_group_id = module.Security_group.security_group_id
  public_subnets_ids    = module.vpc.public_subnets
  auto_scaling_group = var.auto_scaling_group
}

module "ALB" {

  source                = "./modules/Load_balancer"
  alb_name              = var.alb_name
  vpc_security_group_id = module.Security_group.security_group_id
  public_subnets_ids    = module.vpc.public_subnets
  target_group_name     = var.target_group_name
  vpc_id                = module.vpc.vpc_id
  aws_instance_ids      = module.EC2.instance_ids
  auto_scaling_group = var.auto_scaling_group
}

module "auto_scaling_group" {

  source                = "./modules/auto-scaling"
  ami                   = var.ami
  instance_type         = var.instance_type
  user_data             = file("/home/mahmoud/northcoders/cloud/ce-terraform-project/modules/EC2/userdata.tpl")
  desired_capacity      = var.desired_capacity
  max_size              = var.max_size
  min_size              = var.min_size
  vpc_security_group_id = module.Security_group.security_group_id
  key                   = var.key
  public_subnets_ids    = module.vpc.public_subnets
  target_group_arn      = module.ALB.target_group_arn
  auto_scaling_group = var.auto_scaling_group
}