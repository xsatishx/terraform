variable "instance_type" {
//  default     = "t2.nano"
//  description = "Type of instance to be provisioned"
}

variable "instance_type_sel" {
  type = "map"
  default = {
    t2.micro = "t2.micro"
    t2.nano = "t2.nano"
    t2.large = "m2.large"
}

}