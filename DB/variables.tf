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
