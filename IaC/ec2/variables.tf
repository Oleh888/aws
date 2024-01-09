variable "aws_region" {
}

variable "environment" {
}

variable "instance_type" {
  default = "t3.micro"
}

variable "public_subnet_id" {
}

variable "private_subnet_id" {
}

variable "security_group_ids" {
  type = list(string)
}
