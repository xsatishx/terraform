provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source        = "github.com/xsatishx/terraform/vpc"
  tag_name      = "${var.tag_name}"
  tag_company   = "${var.tag_company}"
  tag_applevel  = "${var.tag_applevel}"
  tag_apptype   = "${var.tag_apptype}"
  tag_appname   = "${var.tag_apptype}"
  tag_function  = "${var.tag_function}"
  tag_adminname = "${var.tag_adminname}"
}

module "db" {
  source                 = "github.com/xsatishx/terraform/DB"
  identifier             = "testprojectdb"
  vpc_security_group_ids = ["${module.vpc.vpc_security_group_ids}"]
  subnet_ids             = ["${module.vpc.intra_subnets}"]
  tag_name               = "${var.tag_name}"
  tag_company            = "${var.tag_company}"
  tag_applevel           = "${var.tag_applevel}"
  tag_apptype            = "${var.tag_apptype}"
  tag_appname            = "${var.tag_apptype}"
  tag_function           = "${var.tag_function}"
  tag_adminname          = "${var.tag_adminname}"
}

module "ec2_instance" {
  source                 = "github.com/xsatishx/terraform/EC2"
  vpc_security_group_ids = ["${module.vpc.vpc_security_group_ids}"]
  subnet_ids             = ["${module.vpc.intra_subnets}"]
  tag_name               = "TestProject-intance"
  ebs_count              = 0
  tag_name               = "${var.tag_name}"
  tag_company            = "${var.tag_company}"
  tag_applevel           = "${var.tag_applevel}"
  tag_apptype            = "${var.tag_apptype}"
  tag_appname            = "${var.tag_apptype}"
  tag_function           = "${var.tag_function}"
  tag_adminname          = "${var.tag_adminname}"
}

module "elb_http" {
  source              = "github.com/xsatishx/terraform/ELB"
  name                = "testprojectelb"
  subnets             = ["${module.vpc.intra_subnets}"]
  security_groups     = ["${module.vpc.vpc_security_group_ids}"]
  number_of_instances = 2
  instances           = ["${module.ec2_instance.ids}"]
  tag_name            = "${var.tag_name}"
  tag_company         = "${var.tag_company}"
  tag_applevel        = "${var.tag_applevel}"
  tag_apptype         = "${var.tag_apptype}"
  tag_appname         = "${var.tag_apptype}"
  tag_function        = "${var.tag_function}"
  tag_adminname       = "${var.tag_adminname}"
}

/*
resource "aws_elb_attachment" "forfirstinstance" {
  elb      = "${module.elb_http.this_elb_id}"
  instance = "${module.ec2_instance.ids[0]}"
}

resource "aws_elb_attachment" "forsecondinstance" {
  elb      = "${module.elb_http.this_elb_id}"
  instance = "${module.ec2_instance.ids[1]}"
}
*/

