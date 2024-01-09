variable "aws_region" {
  default = "us-east-2"
}

variable "environment" {
  default = "hw-demo"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnets_cidr" {
  default = "10.0.101.0/24"
}
