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

  # DB parameter group
  family = "${var.family}"

  # DB option group
  major_engine_version = "${var.major_engine_version}"

  publicly_accessible       = "${var.publicly_accessible}"
  final_snapshot_identifier = "${var.final_snapshot_identifier}"
  deletion_protection       = "${var.deletion_protection}"
  subnet_ids                = "${var.subnet_ids}"

  tags = {
    "tag_environment"  = "${var.tag_environment}"
    "tag_company"      = "${var.tag_company}"
    "tag_applevel"     = "${var.tag_applevel}"
    "tag_apptype"      = "${var.tag_apptype}"
    "tag_appname"      = "${var.tag_apptype}"
    "tag_function"     = "${var.tag_function}"
    "tag_adminname1"   = "${var.tag_adminname1}"
    "tag_adminname2"   = "${var.tag_adminname2}"
    "tag_dbadminname1" = "${var.tag_dbadminname1}"
    "tag_dbadminname2" = "${var.tag_dbadminname2}"
    "tag_ec2startstop" = "${var.tag_ec2startstop}"
    "tag_ec2backup"    = "${var.tag_ec2backup}"
    "tag_createdby"    = "${var.tag_createdby}"
  }

  options = [
    {
      option_name = "${var.option_name}"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "${var.option_server_audit_events}"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "${var.server_audit_file_rotations}"
        },
      ]
    },
  ]

  parameters = [
    {
      name  = "join_buffer_size"
      value = "${var.parameter_join_buffer_size}"
    },
    {
      name  = "log_output"
      value = "${var.parameter_log_output}"
    },
    {
      name  = "log_bin_trust_function_creators"
      value = "${var.parameter_log_bin_trust_function_creators}"
    },
    {
      name  = "log_queries_not_using_indexes"
      value = "${var.parameter_log_queries_not_using_indexes}"
    },
    {
      name  = "long_query_time"
      value = "${var.parameter_long_query_time}"
    },
    {
      name  = "max_allowed_packet"
      value = "${var.parameter_max_allowed_packet}"
    },
    {
      name  = "max_connections"
      value = "${var.parameter_max_connections}"
    },
    {
      name  = "slow_query_log"
      value = "${var.parameter_slow_query_log}"
    },
    {
      name  = "sql_mode"
      value = "${var.parameter_sql_mode}"
    },
    {
      name  = "time_zone"
      value = "${var.parameter_time_zone}"
    },
  ]
}

// https://github.com/terraform-providers/terraform-provider-aws/issues/4597    Option group does not get deleted

