variable "name" {
  description = " Name to be used on all the resources as identifier"
  default     = "custom-vpc"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = "list"
}

variable "cidr" {
  description = " The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "enable_nat_gateway" {
  default = "true"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type = "list"

  default = [
  ]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = "list"
  default = [

  ]
}

variable "intra_subnets" {
  description = "A list of intra subnets inside the VPC"
  type = "list"

  default = [

  ]
}

// tags
variable "tag_environment" {
  description = "Tag name to be assigned to the instance"
  default     = "dev"
}

variable "tag_company" {
  description = "Company name to be tagged to the instance"
  default     = ""
}


variable "tag_applevel" {
  description = "Tag the instance with the app level"
  default     = "1"
}

variable "tag_apptype" {
  description = "Tag the instance with the app type"
  default     = "nonprod"
}

variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "app"
}

variable "tag_adminname1" {
  description = "Tag the instance with the admins name"
}

variable "tag_adminname2" {
  description = "Tag the instance with the admins name"
}

variable "tag_createdby" {
  description = "To specify how this instance was created"
  default     = "Terraform"
}
