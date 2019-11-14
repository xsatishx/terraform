variable "ami" {
  description = "Amazon Machine ID used for provisioning the instance"
}

variable "vpc_security_group_ids" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}

variable "subnets" {
  type = "list"
}

variable "instance_type" {
  type = "string"
}

variable "key_name" {
  type = "string"
}

variable "min_size" {
  default = 3
}

variable "max_size" {
  default = 4
}

variable "user_data" {
  default     = " "
  description = "Enter any user data here"
}

variable "lb_name" {
  default = "-application-load-balancer"
}

variable "lc_name" {
  type    = "string"
  default = "-launch-configuration"
}

variable "autoscaling_group_name" {
  type    = "string"
  default = "-autoscaling-instance"
}

variable "health_check_type" {
  default = "EC2"
}

variable "associate_public_ip_address" {
  default = false
}

variable "recreate_asg_when_lc_changes" {
  default = true
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
  default     = "0"
}

variable "tag_apptype" {
  description = "Tag the instance with the app type"
  default     = "nonprod"
}

variable "tag_appname" {
  description = "Tag the instance with the app name"
  default     = ""
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

variable "tag_ec2startstop" {
  description = "Tag the instance ec2 start and stop time and date"
  default     = "Mon-Fri_07:00-21:00"
}

variable "tag_ec2backup" {
  description = "Tag the instance with ec2 backup details"
  default     = "dev-2M"
}

variable "tag_createdby" {
  description = "To specify how this instance was created"
  default     = "terraform"
}
