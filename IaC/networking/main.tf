module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "${var.environment}-vpc"
  cidr               = var.vpc_cidr
  azs                = [local.availability_zone]
  public_subnets     = [var.public_subnet_cidr]
  private_subnets    = [var.private_subnet_cidr]
  create_igw         = true
  enable_nat_gateway = true
  map_public_ip_on_launch = true

  private_subnet_tags = {
    "Tier" = "Private"
  }

  public_subnet_tags = {
    "Tier" = "Public"
  }

  tags = {
    Environment = var.environment
  }
}
