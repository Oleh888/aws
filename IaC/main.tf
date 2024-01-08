terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  required_version = ">= 1.5.7"
}

module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = "${var.environment}-vpc"
  cidr               = var.vpc_cidr
  azs                = [local.availability_zone]
  public_subnets     = [var.public_subnets_cidr]
  private_subnets    = [var.private_subnets_cidr]
  create_igw         = true
  enable_nat_gateway = true

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

resource "aws_instance" "public_instance" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.instance_type
  subnet_id     = element(module.vpc.public_subnets, 0)

  tags = {
    Name        = "${var.environment}-public-ec2-instance"
    Environment = var.environment
  }
}

resource "aws_instance" "private_instance" {
  ami           = data.aws_ami.ubuntu.image_id
  instance_type = var.instance_type
  subnet_id     = element(module.vpc.private_subnets, 0)

  tags = {
    Name        = "${var.environment}-private-ec2-instance"
    Environment = var.environment
  }
}
