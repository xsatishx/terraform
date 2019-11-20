variable "identifier" {
  default     = "scbdatabase"
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "engine" {
  default     = "mysql"
  description = "The database engine to use"
}

variable "engine_version" {
  default     = "5.7.19"
  description = "The engine version to use"
}

variable "allocated_storage" {
  default     = 5
  description = "The allocated storage in gigabytes"
}

variable "maintenance_window" {
  default     = "Mon:00:00-Mon:03:00"
  description = "The window to perform maintenance in"
}

variable "backup_window" {
  default     = "03:00-06:00"
  description = " The daily time range (in UTC) during which automated backups are created if they are enabled. Must not overlap with maintenance_window"
}

variable "instance_class" {
  default     = "db.t2.micro"
  description = "The instance type of the RDS instance"
}

variable "username" {
  default     = "user"
  description = "Username for the database"
}

variable "password" {
  default     = "password"
  description = "Password for the database"
}

variable "port" {
  default     = "3306"
  description = "The port on which the DB accepts connections"
}

# optional
variable "vpc_security_group_ids" {
  description = "Subnet ID where the isntance has to be created"
  type        = "list"
  default = [
    "sg-058aa84cc8c2c2f6f",
    "sg-f52ab79f",
  ]
}

variable "publicly_accessible" {
  default     = "false"
  description = "Bool to control if instance is publicly accessible"
}

variable "final_snapshot_identifier" {
  default     = "scbdatabase-snapshot"
  description = "Database snapshot identifier"
}

variable "deletion_protection" {
  default     = "false"
  description = "The database can't be deleted when this value is set to true"
}

variable "subnet_ids" {
  type = "list"
  default = [
    "subnet-64d2ec0c",
    "subnet-f0325fbc",
  ]
  description = "A list of subnet IDS"
}




// tags
variable "tag_environment" {
  description = "Tag name to be assigned to the instance"
  default     = "dev"
}

variable "tag_adminname" {
  description = "Tag the instance with the admins name"
  default     = "admin@admin.com"
}

variable "tag_createdby" {
  description = "To specify how this instance was created"
  default     = "Terraform"
}
