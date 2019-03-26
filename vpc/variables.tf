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
