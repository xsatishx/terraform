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

variable "family" {
  default     = "mysql5.7"
  description = "The family of the DB parameter grou"
}

variable "major_engine_version" {
  default     = "5.7"
  description = "Specifies the major version of the engine that this option group should be associated with"
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

variable "option_name" {
  default     = "MARIADB_AUDIT_PLUGIN"
  description = "Option name"
}

variable "option_server_audit_events" {
  default     = "CONNECT"
  description = ""
}

variable "server_audit_file_rotations" {
  default     = "37"
  description = ""
}

variable "parameter_join_buffer_size" {
  default = "1000"
}

variable "parameter_log_output" {
  default = "FILE"
}

variable "parameter_log_bin_trust_function_creators" {
  default = "1"
}

variable "parameter_log_queries_not_using_indexes" {
  default = "0"
}

variable "parameter_long_query_time" {
  default = "2"
}

variable "parameter_max_allowed_packet" {
  default = "1024194304"
}

variable "parameter_max_connections" {
  default = "50"
}

variable "parameter_slow_query_log" {
  default = "1"
}

variable "parameter_sql_mode" {
  default = "NO_AUTO_CREATE_USER,STRICT_ALL_TABLES"
}

variable "parameter_time_zone" {
  default = "Asia/Bangkok"
}
