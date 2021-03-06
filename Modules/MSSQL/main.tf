module "db" {
  //https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/1.26.0
  source                              = "terraform-aws-modules/rds/aws"
  version                             = "1.28.0"
  identifier                          = "${var.identifier}"
  engine                              = "${var.engine}"
  engine_version                      = "${var.engine_version}"
  major_engine_version                = "${var.major_engine_version}"
  family                              = "${var.family}"
  instance_class                      = "${var.instance_class}"
  allocated_storage                   = "${var.allocated_storage}"
  storage_encrypted                   = "${var.storage_encrypted}"
  name                                = "${var.name}"
  username                            = "${var.username}"
  password                            = "${var.password}"
  port                                = "${var.port}"
  vpc_security_group_ids              = "${var.vpc_security_group_ids}"
  subnet_ids                          = "${var.subnet_ids}"
  maintenance_window                  = "${var.maintenance_window}"
  backup_window                       = "${var.backup_window}"
  backup_retention_period             = "${var.backup_retention_period}"
  publicly_accessible                 = "${var.publicly_accessible}"
  multi_az                            = "${var.multi_az}"
  final_snapshot_identifier           = "${var.final_snapshot_identifier}"
  license_model                       = "${var.license_model}"
  timezone                            = "${var.timezone}"
  deletion_protection                 = "${var.deletion_protection}"
  allow_major_version_upgrade         = "${var.allow_major_version_upgrade}"
  auto_minor_version_upgrade          = "${var.auto_minor_version_upgrade}"
  iam_database_authentication_enabled = "${var.iam_database_authentication_enabled}"

  tags                                = {
    "Environment"                     = "${var.tag_environment}"
    "Company"                         = "${var.tag_company}"
    "AppLevel"                        = "${var.tag_applevel}"
    "AppType"                         = "${var.tag_apptype}"
    "AppName"                         = "${var.tag_appname}"
    "Function"                        = "${var.tag_function}"
    "AdminName1"                      = "${var.tag_adminname1}"
    "AdminName2"                      = "${var.tag_adminname2}"
    "DBadminName1"                    = "${var.tag_dbadminname1}"
    "DBAdminName2"                    = "${var.tag_dbadminname2}"
    "CreatedBy"                       = "${var.tag_createdby}"
  }
}
