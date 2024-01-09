variable "aws_region" {
}

variable "environment" {
}

variable "vpc_cidr" {
}

variable "public_subnet_cidr" {
}

variable "private_subnet_cidr" {
}

locals {
  availability_zone = "${var.aws_region}a"
}
