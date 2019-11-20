provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "https://github.com/xsatishx/terraform/Modules/vpc"
}

module "EC2" {
  source = "https://github.com/xsatishx/terraform/Modules/EC2"
}
module "db" {
  source                 = "../Modules/RDS/MYSQL"
  identifier             = "${var.identifier}"
  username               = "${var.username}"
  password               = "${var.password}"
  subnet_ids             = "${var.subnet_ids}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  tag_applevel           = "${var.tag_applevel}"
  tag_appname            = "${var.tag_appname}"
  tag_function           = "${var.tag_function}"
  tag_adminname1         = "${var.tag_adminname1}"
  tag_adminname2         = "${var.tag_adminname2}"
  tag_dbadminname1       = "${var.tag_dbadminname1}"
  tag_dbadminname2       = "${var.tag_dbadminname2}"
}
