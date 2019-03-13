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
  type = "list"
}

variable "device_name" {
  type = "list"
}

variable "ebs_count" {}
variable "ebs_size" {}
variable "ebs_type" {}
variable "skip_destroy" {}
