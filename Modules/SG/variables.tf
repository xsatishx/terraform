variable "name" {
    type = "string"
}

variable "ingress_with_cidr_blocks" {
  type = "list"
}

variable "egress_with_cidr_blocks" {
  type = "list"
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "All Traffic"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
variable "vpc_id" {
    type = "string"
}

variable "tag_appname" {
  type = "string"
}

variable "tag_adminname1" {
    type = "string"
}

variable "tag_createdate" {
  type = "string"
}

variable "tag_lastmodifydate" {
      type = "string"
      default = "foo"
}
