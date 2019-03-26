provider "aws" {
  region = "ap-northeast-2"
}

module "elb_http" {
  source = "terraform-aws-modules/elb/aws"

  name            = "${var.name}"
  subnets         = "${var.subnets}"
  security_groups = "${var.security_groups}"
  internal        = "${var.internal}"

  listener = [
    {
      instance_port     = "${var.instance_port}"
      instance_protocol = "${var.instance_protocol}"
      lb_port           = "${var.lb_port}"
      lb_protocol       = "${var.lb_protocol}"
    },
  ]

  health_check = [
    {
      target              = "${var.target}"
      interval            = "${var.hc_interval}"
      healthy_threshold   = "${var.hc_healthy}"
      unhealthy_threshold = "${var.hc_unhealthy}"
      timeout             = "${var.hc_timeout}"
    },
  ]

  tags = {
    "tag_environment"  = "${var.tag_environment}"
    "tag_company"      = "${var.tag_company}"
    "tag_applevel"     = "${var.tag_applevel}"
    "tag_apptype"      = "${var.tag_apptype}"
    "tag_appname"      = "${var.tag_apptype}"
    "tag_function"     = "${var.tag_function}"
    "tag_adminname1"   = "${var.tag_adminname1}"
    "tag_adminname2"   = "${var.tag_adminname2}"
    "tag_dbadminname1" = "${var.tag_dbadminname1}"
    "tag_dbadminname2" = "${var.tag_dbadminname2}"
    "tag_ec2startstop" = "${var.tag_ec2startstop}"
    "tag_ec2backup"    = "${var.tag_ec2backup}"
    "tag_createdby"    = "${var.tag_createdby}"
  }

  // These 2 values come from ec2 instances module or have to enter via command line args
  number_of_instances = "${var.number_of_instances}"
  instances           = "${var.instances}"
}

/*
module "ec2_instance" {
  # source         = "github.com/xsatishx/terraform/EC2"
  source = "./../EC2"

  #  instance_count         = "${var.number_of_instances}"
  #  ami                    = "ami-078e96948945fc2c9"
  #  instance_type          = "t2.micro"
  #  vpc_security_group_ids = ["sg-058aa84cc8c2c2f6f", "sg-f52ab79f"]
  #  subnet_ids             = ["subnet-64d2ec0c", "subnet-f0325fbc"]
  #  ebs_count              = "${var.ebs_count}"
}
*/

