// EC2 mandatory variables

variable "ami" {
  default     = "ami-06e7b9c5e0c4dd014"
  description = "Amazon Machine ID used for provisioning the instance"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Type of instance to be provisioned"
}

variable "name" {
  default     = "terraform-instance"
  description = "Assign this name to the instance"
}

variable "vpc_security_group_ids" {
  description = "Subnet ID where the isntance has to be created"
  type        = "list"

  default = [
    "sg-0f02020b4734ff969",
    "sg-f52ab79f",
  ]
}

// EC2 optional variables

variable "user_data" {
  default     = ""
  description = "Enter any user data here"
}

variable "iam_instance_profile" {
  default     = "Full_S3_access_from_EC2"
  description = "iam role to enable ec2 to access s3"
}

variable "instance_count" {
  default     = 1
  description = "Number of amazon instance to be provisioned"
}

variable "key_name" {
  default     = "satish-"
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

variable "ebs_count" {
  default     = 0
  description = "Enter the number EBS volumes to attach to the instance"
}

variable "ebs_size" {
  description = "Size of the EBS volumes. This has to be consisten with EBS_count and block_device_names"
  default     = 100
}

variable "ebs_type" {
  description = "EBS type"
  default     = "gp2"
}

variable "block_device_names" {
  description = "Enter the block device name (refer to aws doc)- the total default names should be equal to the ebs_count value"
  default     = "xvdh"
}

variable "tag_name" {
  description = "Tag name to be assigned to the instance"
  default     = "app"
}


variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "SIT"
}

variable "tag_adminname" {
  description = "Tag the instance with the admins name"
  default     = "admin"
}

variable "root_volume_size" {
  description = "Size of the Root volume"
  default     = 20
}

variable "root_volume_type" {
  description = "Type of the root volume"
  default     = "gp2"
}
/*
variable "ebs_device_name" {
  type = "map"

  default = {
    i0 = "xvdh"
    i1 = "xvdi"
  }
}
*/
