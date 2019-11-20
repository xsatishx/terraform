output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

# Subnets
/*
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.vpc.private_subnets}"]
}
*/
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.vpc.public_subnets}"]
}

output "intra_subnets" {
  description = "List of IDs of intra subnets"
  value       = ["${module.vpc.intra_subnets}"]
}

output "vpc_security_group_ids" {
  description = "vpc security group ids"
  value       = ["${module.vpc.default_security_group_id}"]
}
