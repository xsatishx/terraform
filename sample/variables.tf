variable "tag_name" {
  description = "Tag name to be assigned to the instance"
  default     = "app"
}

variable "tag_company" {
  description = "Company name to be tagged to the instance"
  default     = "SCB"
}

variable "tag_applevel" {
  description = "Tag the instance with the app level"
  default     = "4"
}

variable "tag_apptype" {
  description = "Tag the instance with the app type"
  default     = "webapp"
}

variable "tag_appname" {
  description = "Tag the instance with the app name"
  default     = "RPS"
}

variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "SIT"
}

variable "tag_adminname" {
  description = "Tag the instance with the admins name"
  default     = "admin"
}
