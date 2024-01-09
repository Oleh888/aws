module "ec2" {
  source             = "./ec2"
  aws_region         = var.aws_region
  environment        = var.environment
  public_subnet_id   = module.networking.public_subnet_id
  private_subnet_id  = module.networking.private_subnet_id
  security_group_ids = [module.networking.security_group_id]
}

module "networking" {
  aws_region          = var.aws_region
  environment         = var.environment
  source              = "./networking"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnets_cidr
  private_subnet_cidr = var.private_subnets_cidr
}
