provider "aws" {
  region = "ap-northeast-2"
}

module "EC2" {
  source         = "git::https://github.com/xsatishx/terraform.git//Modules/EC2"
  tag_name       = "Satish"
  tag_company    = "Satish"
  tag_applevel   = "1"
  tag_function   = "Test"
  tag_apptype    = "NewApp"
  tag_appname    = "MyApp"
  tag_adminname  = "Satish"
  instance_count = 2
}

module "EBS" {
  source       = "git::ssh://git@192.168.1.158/scb-templates/modules.git//Compute/EBS"
  instance_az  = ["${module.EC2.instance_az}"]
  ebs_size     = "${var.ebs_size}"
  ebs_type     = "${var.ebs_type}"
  instance_ids = ["${module.EC2.instance_ids}"]
  count        = "${var.count}"
  device_name  = "${var.device_name_1}"
}
