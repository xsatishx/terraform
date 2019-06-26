output "RDS instance address" {
  description = "The address of the RDS instance"
  value       = "${module.db.this_db_instance_address}"
}

output "RDS instance endpoint" {
  description = "The connection endpoint"
  value       = "${module.db.this_db_instance_endpoint}"
}

output "RDS instance username" {
  description = "The master username for the database"
  value       = "${module.db.this_db_instance_username}"
}

output "RDS instance password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = "${module.db.this_db_instance_password}"
}

output "RDS instance port" {
  description = "The database port"
  value       = "${module.db.this_db_instance_port}"
}

output "ELB target group ARNs" {
  description = "The arn of the target groups"
  value       = "${module.alb.target_group_arns}"
}

output "ALB DNS name" {
  description = "DNS name of the Application Load balancer"
  value       = "${module.alb.dns_name}"
}
