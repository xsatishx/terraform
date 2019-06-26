provider "aws" {
  region = "ap-northeast-2"
}

module "http-sg" {
  source         = "../Modules/SG"
  name           = "${var.sg_name}"
  vpc_id         = "${var.vpc_id}"
  tag_appname    = "${var.tag_appname}"
  tag_adminname1 = "${var.tag_adminname1}"
  tag_createdate = "${var.tag_createdate}"

  tag_lastmodifydate = "${var.tag_createdate}"

  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      description = "https"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "alb" {
  source                 = "../Modules/ALB"
  ami                    = "${var.ami}"
  vpc_id                 = "${var.vpc_id}"
  subnets                = "${var.subnet_ids}"
  vpc_security_group_ids = ["${module.http-sg.this_security_group_id}"]
  instance_type          = "${var.instance_type}"
  key_name               = "${var.key_name}"

  #load_balancer_name     = "${var.alb_name}"
  autoscaling_group_name = "${var.ag_name}"
  user_data              = "${file("user_data.sh")}"
  tag_applevel           = "${var.tag_applevel}"
  tag_function           = "${var.tag_function}"
  tag_appname            = "${var.tag_appname}"
  tag_adminname1         = "${var.tag_adminname1}"
  tag_adminname2         = "${var.tag_adminname2}"
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
