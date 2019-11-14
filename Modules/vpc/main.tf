module "vpc" {
  // https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/1.59.0
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.59.0"

  name = "${var.name}"
  cidr = "${var.cidr}"
  azs  = "${var.azs}"

  // use intra_subnet if If you need private subnets that should have no Internet routing else use private_subnets
  intra_subnets  = "${var.intra_subnets}"
  private_subnets = "${var.private_subnets}"
  public_subnets = "${var.public_subnets}"

  enable_nat_gateway = "${var.enable_nat_gateway}"

  tags = {
    "Environment"  = "${var.tag_environment}"
    "Company"      = "${var.tag_company}"
    "AppType"      = "${var.tag_apptype}"
    "AdminName1"   = "${var.tag_adminname1}"
    "AdminName2"   = "${var.tag_adminname2}"
    "CreatedBy"    = "${var.tag_createdby}"
  }

}
