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

variable "tag_adminname" {
  description = "Tag the instance with the admins name"
  default     = "admin@admin.com"
}

variable "tag_createdby" {
  description = "To specify how this instance was created"
  default     = "Terraform"
}
