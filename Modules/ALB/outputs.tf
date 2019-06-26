output "target_group_arns" {
  description = "The arn of the target groups"
  value       = "${module.ALB.target_group_arns}"
}

output "dns_name" {
  description = "DNS name of the Load balancer"
  value       = "${module.ALB.dns_name}"
}
