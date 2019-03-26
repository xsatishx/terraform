variable "name" {
  description = " Name to be used on all the resources as identifier"
  default     = "myELB"
}

variable "subnets" {
  type        = "list"
  description = "List of subnets to be associated with the instance"

  default = [
    "subnet-64d2ec0c",
    "subnet-f0325fbc",
  ]
}

variable "security_groups" {
  description = "Subnet ID where the isntance has to be created"
  type        = "list"

  default = [
    "sg-058aa84cc8c2c2f6f",
    "sg-f52ab79f",
  ]
}

variable "internal" {
  description = "Set true if you want to create a internal load balancer"
  default     = false
}

variable "target" {
  description = "Load balancer target port for health check"
  default     = "HTTP:80/"
}

variable "instance_port" {
  description = "The instance port where the application runs"
  default     = "80"
}

variable "instance_protocol" {
  description = "Instance protocol"
  default     = "HTTP"
}

variable "lb_port" {
  description = "The load balance port"
  default     = "80"
}

variable "lb_protocol" {
  description = "Load balancer protocol"
  default     = "HTTP"
}

variable "hc_interval" {
  description = "Health check interval time"
  default     = 30
}

variable "hc_healthy" {
  description = "Health check healthy threshold"
  default     = 2
}

variable "hc_unhealthy" {
  description = "Health check unhealthy threshold"
  default     = 2
}

variable "hc_timeout" {
  description = "Health check time out"
  default     = 5
}

variable "number_of_instances" {
  description = "Number of instances to attach to ELBs"
}

variable "instances" {
  type        = "list"
  description = "Instances to be associated to the LB"
}

/*
variable "ebs_count" {
  description = "Number of ebs volumes required"
  default     = 0
}
*/

// tags
variable "tag_name" {
  description = "Tag name to be assigned to the instance"
  default     = "app"
}

variable "tag_company" {
  description = "Company name to be tagged to the instance"
  default     = "SCB"
}

variable "tag_applevel" {
  description = "Tag the instance with the app level"
  default     = "4"
}

variable "tag_apptype" {
  description = "Tag the instance with the app type"
  default     = "webapp"
}

variable "tag_appname" {
  description = "Tag the instance with the app name"
  default     = "RPS"
}

variable "tag_function" {
  description = "Tag the instance with the app function"
  default     = "SIT"
}

variable "tag_adminname" {
  description = "Tag the instance with the admins name"
  default     = "admin"
}
