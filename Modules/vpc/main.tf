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
  //intra_subnets  = "${var.private_subnets}"
  public_subnets = "${var.public_subnets}"

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    "tag_environment"  = "${var.tag_environment}"
    "tag_adminname"   = "${var.tag_adminname}"
    "tag_createdby"    = "${var.tag_createdby}"
  }
}
