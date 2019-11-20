output " VPC ID" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}

output "Database Endpoint" {
  description = "The connection endpoint"
  value       = "${module.db.this_db_instance_endpoint}"
}

output "Database Username" {
  description = "The master username for the database"
  value       = "${module.db.this_db_instance_username}"
}

output "Database Password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = "${module.db.this_db_instance_password}"
}

output "EC2 Instance Public_IP" {
  description = "Public IP of instances"
  value       = "${module.ec2_instance.public_ip}"
}

