provider "aws" {
  region = "ap-northeast-2"
}

module "db" {
  //https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/1.26.0
  source             = "terraform-aws-modules/rds/aws"
  version            = "1.26.0"
  identifier         = "scbdatabase"
  engine             = "mysql"
  engine_version     = "5.7.19"
  instance_class     = "db.t2.micro"
  allocated_storage  = 5
  name               = "scbdatabase"
  username           = "user"
  password           = "password"
  port               = "3306"
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"

  publicly_accessible       = "false"
  final_snapshot_identifier = "scbdatabase-snapshot"
  deletion_protection       = "false"
  subnet_ids                = ["subnet-64d2ec0c", "subnet-f0325fbc"]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]

  parameters = [
    {
      name  = "join_buffer_size"
      value = "1000"
    },
    {
      name  = "log_output"
      value = "FILE"
    },
    {
      name  = "log_bin_trust_function_creators"
      value = "1"
    },
    {
      name  = "log_queries_not_using_indexes"
      value = "0"
    },
    {
      name  = "long_query_time"
      value = "2"
    },
    {
      name  = "max_allowed_packet"
      value = "1024194304"
    },
    {
      name  = "max_connections"
      value = "50"
    },
    {
      name  = "slow_query_log"
      value = "1"
    },
    {
      name  = "sql_mode"
      value = "NO_AUTO_CREATE_USER,STRICT_ALL_TABLES"
    },
    {
      name  = "time_zone"
      value = "Asia/Bangkok"
    },
  ]
}
