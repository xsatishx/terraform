/*
variable "vpc_id" {
  default = "vpc-21232449"
}

variable "subnet_ids" {
  description = "A list of subnet IDS"
  type        = "list"
  default     = ["subnet-64d2ec0c", "subnet-b08558cb", "subnet-f0325fbc"]
}

variable "vpc_security_group_ids" {
  description = "Subnet ID where the instance has to be created"
  type        = "list"
  default     = ["sg-0f02020b4734ff969"]
}

variable "sg_name" {
  default = "-http-sg"
}

variable "alb_name" {
  default = "-ALB"
}

variable "ag_name" {
  default = "-ASG"
}

variable "ami" {
  default = "ami-0c28c81fda53dcb86"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "satish-"
}

// DB variables

variable "identifier" {
  default     = "db"
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
}

variable "username" {
  default     = "user"
  description = "Username for the database"
}

variable "password" {
  default     = "password"
  description = "Password for the database"
}

// tags

variable "tag_applevel" {
  description = "Tag the instance with the app level"
  default     = "1"
}

variable "tag_appname" {
  description = "Tag the instance with the app name"
  default     = "Sample App"
}

variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "app"
}

variable "tag_adminname1" {
  description = "Tag the instance with the admins name"
  default     = "admin1@.co.th"
}

variable "tag_adminname2" {
  description = "Tag the instance with the admins name"
  default     = "xyz@.co.th"
}

variable "tag_dbadminname1" {
  description = "Tag the instance with the admins name"
  default     = "xyz@.co.th"
}

variable "tag_dbadminname2" {
  description = "Tag the instance with the admins name"
  default     = "xyz@.co.th"
}

variable "tag_createdate" {
  default = "15 May 2019"
}

variable "tag_lastmodifydate" {
  default = "20190404"
}
*/