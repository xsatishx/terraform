// tags
variable "tag_environment" {
  description = "Tag name to be assigned to the instance"
  default     = "dev"
}

variable "tag_company" {
  description = "Company name to be tagged to the instance"
  default     = "scb"
}

variable "tag_applevel" {
  description = "Tag the instance with the app level"
  default     = "1"
}

variable "tag_apptype" {
  description = "Tag the instance with the app type"
  default     = "nonprod"
}

variable "tag_appname" {
  description = "Tag the instance with the app name"
  default     = "scbeasymobile"
}

variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "app"
}

variable "tag_adminname1" {
  description = "Tag the instance with the admins name"
  default     = "abc@scb.co.th"
}

variable "tag_adminname2" {
  description = "Tag the instance with the admins name"
  default     = "xyz@scb.co.th"
}

variable "tag_dbadminname1" {
  description = "Tag the instance with the db admin name"
  default     = "abcd@scb.co.th"
}

variable "tag_dbadminname2" {
  description = "Tag the instance with the db admin name"
  default     = "xyzd@scb.co.th"
}

variable "tag_ec2startstop" {
  description = "Tag the instance ec2 start and stop time and date"
  default     = "Mon-Fri_07:00-21:00"
}

variable "tag_ec2backup" {
  description = "Tag the instance with ec2 backup details"
  default     = "dev-2M"
}

variable "tag_createdby" {
  description = "To specify how this instance was created"
  default     = "Terraform"
}
