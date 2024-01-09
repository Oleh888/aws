output "public_subnet_id" {
  value = module.vpc.public_subnets[0]
}

output "private_subnet_id" {
  value = module.vpc.private_subnets[0]
}

output "security_group_id" {
  value = module.vpc.default_security_group_id
}