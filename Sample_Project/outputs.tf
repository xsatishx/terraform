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


