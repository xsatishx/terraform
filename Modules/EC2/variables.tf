variable "count" {
  default     = 3
  description = "Number of ec2 instance(s) to be provisioned"
}

variable "ami" {
  default     = "ami-06e7b9c5e0c4dd014"
  description = "Amazon Machine ID used for provisioning the instance"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Type of instance to be provisioned"
}

variable "associate_public_ip_address" {
  default     = ""
  description = ""
}

variable "key_name" {
  default     = ""
  description = ""
}

variable "iam_role" {
  default     = ""
  description = ""
}

variable "tag_name" {
  default     = ""
  description = ""
}

variable "tag_company" {
  default     = ""
  description = ""
}

variable "tag_applevel" {
  default     = ""
  description = ""
}

variable "tag_apptype" {
  default     = ""
  description = ""
}

variable "tag_appname" {
  default     = ""
  description = ""
}

variable "tag_function" {
  default     = ""
  description = ""
}

variable "tag_adminname" {
  default     = ""
  description = ""
}

variable "ec2_sg" {
  type = "list"

  default = [
    "something",
    "something else",
    "something yet else",
  ]

  description = ""
}

variable "subnet_id" {
  type = "list"

  default = [
    "something",
    "something else",
    "something yet else",
  ]

  description = ""
}

variable "vpc_id" {
  default     = ""
  description = ""
}
