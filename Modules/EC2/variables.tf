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
  default     = "true"
  description = " Associate a public ip address with the instance. The value is Boolean "
}

variable "key_name" {
  default     = "satish-scb"
  description = "The key name that can be used to ssh into the instance"
}

variable "iam_role" {
  default     = "Full_S3_access_from_EC2"
  description = "iam role to enable ec2 to access s3"
}

variable "tag_name" {
  default     = "TestProject"
  description = "Tag the name of the project"
}

variable "tag_company" {
  default     = "SCB"
  description = "Tag the instance with the name of the company"
}

variable "tag_applevel" {
  default     = "2"
  description = "Tag the instance with the app level"
}

variable "tag_apptype" {
  default     = "webapp"
  description = "Tag the instance with the app type"
}

variable "tag_appname" {
  default     = "testapp"
  description = "Tag the instance with the name of the app"
}

variable "tag_function" {
  default     = "developer"
  description = "Insert the function of the tag"
}

variable "tag_adminname" {
  default     = "Satish"
  description = "Placeholder to identify the admin"
}

variable "ec2_sg" {
  type = "list"

  default = [
    "sg-058aa84cc8c2c2f6f",
    "sg-f52ab79f",
  ]

  description = "List of security groups to be associated with the instance"
}

variable "subnet_id" {
  type = "list"

  default = [
    "subnet-64d2ec0c",
    "subnet-f0325fbc",
  ]

  description = "List of subnets to be associated with the instance"
}

variable "vpc_id" {
  default     = "vpc-21232449"
  description = "The VPC ID in which the instance will be provisioned"
}
