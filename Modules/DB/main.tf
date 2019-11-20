provider "aws" {
  region = "ap-northeast-2"
}

module "db" {
  //https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/1.26.0
  source                 = "terraform-aws-modules/rds/aws"
  version                = "1.26.0"
  identifier             = "${var.identifier}"
  engine                 = "${var.engine}"
  engine_version         = "${var.engine_version}"
  instance_class         = "${var.instance_class}"
  allocated_storage      = "${var.allocated_storage}"
  name                   = "${var.identifier}"
  username               = "${var.username}"
  password               = "${var.password}"
  port                   = "${var.port}"
  maintenance_window     = "${var.maintenance_window}"
  backup_window          = "${var.backup_window}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  publicly_accessible       = "${var.publicly_accessible}"
  final_snapshot_identifier = "${var.final_snapshot_identifier}"
  deletion_protection       = "${var.deletion_protection}"
  subnet_ids                = "${var.subnet_ids}"
  create_db_option_group   = false
  create_db_parameter_group = false



  tags = {
    "tag_environment"  = "${var.tag_environment}"
    "tag_adminname"   = "${var.tag_adminname}"
    "tag_createdby"    = "${var.tag_createdby}"
  }

}

// https://github.com/terraform-providers/terraform-provider-aws/issues/4597    Option group does not get deleted

