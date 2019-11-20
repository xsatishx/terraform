provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source           = "github.com/xsatishx/terraform/Modules/vpc"
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"
}

module "db" {
  source                 = "github.com/xsatishx/terraform/Modules/DB"
  identifier             = "testprojectdb"
  vpc_security_group_ids = ["${module.vpc.vpc_security_group_ids}"]
  subnet_ids             = ["${module.vpc.intra_subnets}"]
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"
}

module "ec2_instance" {
  source                 = "github.com/xsatishx/terraform/Modules/EC2"
  vpc_security_group_ids = ["${module.vpc.vpc_security_group_ids}"]
  subnet_ids             = ["${module.vpc.intra_subnets}"]
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"
}