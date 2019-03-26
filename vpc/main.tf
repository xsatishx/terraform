provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  // https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/1.59.0
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.59.0"

  name = "${var.name}"
  cidr = "${var.cidr}"
  azs  = "${var.azs}"

  // use intra_subnet if If you need private subnets that should have no Internet routing else use private_subnets
  intra_subnets  = "${var.private_subnets}"
  public_subnets = "${var.public_subnets}"

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    "tag_name"      = "${var.tag_name}"
    "tag_company"   = "${var.tag_company}"
    "tag_applevel"  = "${var.tag_applevel}"
    "tag_apptype"   = "${var.tag_apptype}"
    "tag_appname"   = "${var.tag_apptype}"
    "tag_function"  = "${var.tag_function}"
    "tag_adminname" = "${var.tag_adminname}"
  }
}
