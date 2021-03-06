# AWS RDS Terraform module for MSSQL

Terraform module which creates RDS (MSSQL) resources on AWS.

## Usage

These types of resources are supported:

- [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
- [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
- [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)
- [DB Option Group](https://www.terraform.io/docs/providers/aws/r/db_option_group.html)

Root module calls these modules which can also be used separately to create independent resources:

- [db_instance](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_instance) - creates RDS DB instance
- [db_subnet_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_subnet_group) - creates RDS DB subnet group
- [db_parameter_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_parameter_group) - creates RDS DB parameter group
- [db_option_group](https://github.com/terraform-aws-modules/terraform-aws-rds/tree/master/modules/db_option_group) - creates RDS DB option group

## Required Inputs

| Name                      | Description                                                  |  Type  | Default  | Required |
| ------------------------- | ------------------------------------------------------------ | :----: | :------: | :------: |
| allocated\_storage        | The allocated storage in gigabytes                           | string |   n/a    |   yes    |
| identifier                | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | string |   n/a    |   yes    |
| instance\_class           | The instance type of the RDS instance                        | string |   n/a    |   yes    |
| password                  | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file | string |   n/a    |   yes    |
| subnet\_ids               | A list of VPC subnet IDs                                     |  list  | `<list>` |    no    |
| username                  | Username for the master DB user                              | string |   n/a    |   yes    |
| vpc\_security\_group\_ids | List of VPC security groups to associate                     |  list  | `<list>` |    no    |

## Fixed Inputs

| Name                           | Description                                                  |  Type  |  Default  | Required |
| ------------------------------ | ------------------------------------------------------------ | :----: | :-------: | :------: |
| allow\_major\_version\_upgrade | Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible | string | `"false"` |    no    |
| auto\_minor\_version\_upgrade  | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | string | `"true"`  |    no    |
| backup\_retention\_period      | The days to retain backups for                               | string |   `"1"`   |    no    |
| backup\_window                 | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window | string |    n/a    |   yes    |
| deletion\_protection           | The database can't be deleted when this value is set to true. | string | `"false"` |    no    |
| maintenance\_window            | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00' | string |    n/a    |   yes    |
| port                           | The port on which the DB accepts connections                 | string |    n/a    |   yes    |
| publicly\_accessible           | Bool to control if instance is publicly accessible           | string | `"false"` |    no    |
| storage\_encrypted             | Specifies whether the DB instance is encrypted               | string | `"false"` |    no    |
| storage\_type                  | One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'standard' if not. Note that this behaviour is different from the AWS web console, where the default is 'gp2'. | string |  `"gp2"`  |    no    |
| timezone                       | (Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information. | string |   `""`    |    no    |

## Optional Inputs

| Name                                   | Description                                                  |  Type  |         Default         | Required |
| -------------------------------------- | ------------------------------------------------------------ | :----: | :---------------------: | :------: |
| availability\_zone                     | The Availability Zone of the RDS instance                    | string |          `""`           |    no    |
| copy\_tags\_to\_snapshot               | On delete, copy all Instance tags to the final snapshot (if final_snapshot_identifier is specified) | string |        `"false"`        |    no    |
| create\_monitoring\_role               | Create IAM role with a defined name that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. | string |        `"false"`        |    no    |
| db\_subnet\_group\_name                | Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC | string |          `""`           |    no    |
| enabled\_cloudwatch\_logs\_exports     | List of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine): alert, audit, error, general, listener, slowquery, trace, postgresql (PostgreSQL), upgrade (PostgreSQL). |  list  |        `<list>`         |    no    |
| engine                                 | The database engine to use                                   | string |           n/a           |   yes    |
| engine\_version                        | The engine version to use                                    | string |           n/a           |   yes    |
| family                                 | The family of the DB parameter group                         | string |          `""`           |    no    |
| final\_snapshot\_identifier            | The name of your final DB snapshot when this DB instance is deleted. | string |        `"false"`        |    no    |
| iam\_database\_authentication\_enabled | Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled | string |        `"false"`        |    no    |
| iops                                   | The amount of provisioned IOPS. Setting this implies a storage_type of 'io1' | string |          `"0"`          |    no    |
| kms\_key\_id                           | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used | string |          `""`           |    no    |
| license\_model                         | License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1 | string |          `""`           |    no    |
| major\_engine\_version                 | Specifies the major version of the engine that this option group should be associated with | string |          `""`           |    no    |
| monitoring\_interval                   | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60. | string |          `"0"`          |    no    |
| monitoring\_role\_arn                  | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. Must be specified if monitoring_interval is non-zero. | string |          `""`           |    no    |
| monitoring\_role\_name                 | Name of the IAM role which will be created when create_monitoring_role is enabled. | string | `"rds-monitoring-role"` |    no    |
| multi\_az                              | Specifies if the RDS instance is multi-AZ                    | string |        `"false"`        |    no    |
| name                                   | The DB name to create. If omitted, no database is created initially | string |          `""`           |    no    |
| option\_group\_description             | The description of the option group                          | string |          `""`           |    no    |
| option\_group\_name                    | Name of the DB option group to associate. Setting this automatically disables option_group creation | string |          `""`           |    no    |
| options                                | A list of Options to apply.                                  |  list  |        `<list>`         |    no    |
| parameter\_group\_description          | Description of the DB parameter group to create              | string |          `""`           |    no    |
| parameter\_group\_name                 | Name of the DB parameter group to associate or create        | string |          `""`           |    no    |
| parameters                             | A list of DB parameters (map) to apply                       |  list  |        `<list>`         |    no    |
| replicate\_source\_db                  | Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate. | string |          `""`           |    no    |
| skip\_final\_snapshot                  | Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier | string |        `"true"`         |    no    |
| tags                                   | A mapping of tags to assign to all resources                 |  map   |         `<map>`         |    no    |
| timeouts                               | (Optional) Updated Terraform resource management timeouts. Applies to `aws_db_instance` in particular to permit resource management times |  map   |         `<map>`         |    no    |
| use\_parameter\_group\_name\_prefix    | Whether to use the parameter group name prefix or not        | string |        `"true"`         |    no    |

## Outputs

| Name                                   | Description                                                  |
| -------------------------------------- | ------------------------------------------------------------ |
| this\_db\_instance\_address            | The address of the RDS instance                              |
| this\_db\_instance\_arn                | The ARN of the RDS instance                                  |
| this\_db\_instance\_availability\_zone | The availability zone of the RDS instance                    |
| this\_db\_instance\_endpoint           | The connection endpoint                                      |
| this\_db\_instance\_hosted\_zone\_id   | The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record) |
| this\_db\_instance\_id                 | The RDS instance ID                                          |
| this\_db\_instance\_name               | The database name                                            |
| this\_db\_instance\_password           | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| this\_db\_instance\_port               | The database port                                            |
| this\_db\_instance\_resource\_id       | The RDS Resource ID of this instance                         |
| this\_db\_instance\_status             | The RDS instance status                                      |
| this\_db\_instance\_username           | The master username for the database                         |
| this\_db\_option\_group\_arn           | The ARN of the db option group                               |
| this\_db\_option\_group\_id            | The db option group id                                       |
| this\_db\_parameter\_group\_arn        | The ARN of the db parameter group                            |
| this\_db\_parameter\_group\_id         | The db parameter group id                                    |
| this\_db\_subnet\_group\_arn           | The ARN of the db subnet group                               |
| this\_db\_subnet\_group\_id            | The db subnet group name                                     |

## License

Apache 2 Licensed. See LICENSE for full details.