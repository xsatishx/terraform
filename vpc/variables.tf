variable "name" {
  description = " Name to be used on all the resources as identifier"
  default     = "custom-vpc"
}

variable "cidr" {
  description = " The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = "list"

  default = [
    "ap-northeast-2a",
    "ap-northeast-2c",
  ]
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = "list"

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24",
  ]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = "list"

  default = [
    "10.0.101.0/24",
    "10.0.102.0/24",
  ]
}

// tags

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
