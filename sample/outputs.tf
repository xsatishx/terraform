output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

output "this_db_instance_address" {
  description = "The address of the RDS instance"
  value       = "${module.db.this_db_instance_address}"
}

output "this_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${module.db.this_db_instance_endpoint}"
}

output "this_db_instance_username" {
  description = "The master username for the database"
  value       = "${module.db.this_db_instance_username}"
}

output "this_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = "${module.db.this_db_instance_password}"
}

output "this_db_instance_port" {
  description = "The database port"
  value       = "${module.db.this_db_instance_port}"
}

output "ids" {
  description = "List of IDs of instances"
  value       = "${module.ec2_instance.ids}"
}

output "this_elb_id" {
  description = "The name of the ELB"
  value       = "${module.elb_http.this_elb_id}"
}
