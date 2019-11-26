// EC2 mandatory variables

variable "ami" {
  default     = "ami-06e7b9c5e0c4dd014"
  description = "Amazon Machine ID used for provisioning the instance"
}
//variable "instance_type" {
//  default     = "t2.micro"
//  description = "Type of instance to be provisioned"
//}

variable "instance_type" {}

variable "instance_type_sel" {
  type = "map"
  default = {
    t2.micro = "t2.micro"
    t2.nano = "t2.nano"
    t2.large = "t2.large"
  }
}

variable "name" {
  default     = "terraform-instance"
  description = "Assign this name to the instance"
}

variable "vpc_security_group_ids" {
  description = "Subnet ID where the isntance has to be created"
  type        = "list"
  default = [
    "sg-058aa84cc8c2c2f6f",
    "sg-f52ab79f",
  ]
}

// EC2 optional variables

variable "user_data" {
  default     = "apt-get update"
  description = "Enter any user data here"
}

variable "instance_count" {
  default     = 1
  description = "Number of amazon instance to be provisioned"
}

variable "key_name" {
  default     = "satish-aws-hpe-seoul"
  description = "Type key to be used for ssh"
}

variable "subnet_ids" {
  type        = "list"
  description = "List of subnets to be associated with the instance"
  default = [
    "subnet-64d2ec0c",
    "subnet-f0325fbc",
  ]
}


variable "root_volume_size" {
  description = "Size of the Root volume"
  default     = 20
}

variable "root_volume_type" {
  description = "Type of the root volume"
  default     = "gp2"
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