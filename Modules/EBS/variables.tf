variable "instance_az" {
  type = "list"

  default = [
    "ap-northeast-2a",
    "ap-northeast-2c",
  ]
}

variable "instance_id" {
  type = "list"
}

variable "ebs_tag_name" {
  default     = "TestVol"
  description = "Tag the name of the project"
}

variable "device_name" {
  type = "list"
}

variable "ebs_count" {
  default     = 2
  description = "Number of drives"
}

variable "ebs_size" {
  default     = 8
  description = "The size of the drive in GiBs"
}

variable "ebs_type" {
  default     = "standard"
  description = "he type of EBS volume"
}

variable "skip_destroy" {
  default     = "true"
  description = " Set this to true if you do not wish to detach the volume from the instance to which it is attached at destroy time, and instead just remove the attachment from Terraform state."
}
