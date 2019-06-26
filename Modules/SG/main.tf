module "sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 2.17"
  name    = "${var.name}"
  vpc_id  = "${var.vpc_id}"

  ingress_with_cidr_blocks = "${var.ingress_with_cidr_blocks}"
  egress_with_cidr_blocks  = "${var.egress_with_cidr_blocks}"

  tags = {
    "AppName"        = "${var.tag_appname}"
    "AdminName"      = "${var.tag_adminname1}"
    "createdate"     = "${var.tag_createdate}"
    "lastmodifydate" = "${var.tag_lastmodifydate}"
    "CreatedBy"      = "terraform"
  }
}
