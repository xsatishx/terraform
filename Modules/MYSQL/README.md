# AWS RDS module for MySQL

Terraform module which creates RDS resources on AWS.

These types of resources are supported:

* [DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)
* [DB Subnet Group](https://www.terraform.io/docs/providers/aws/r/db_subnet_group.html)
* [DB Parameter Group](https://www.terraform.io/docs/providers/aws/r/db_parameter_group.html)
* [DB Option Group](https://www.terraform.io/docs/providers/aws/r/db_option_group.html)

## Usage

You can call the module just be itself to run it with all the defaults or specify the 
variables as shown below to modify the defaults.

```
module "db" {
  source		         	= "https://github.com/xsatishx/terraform/tree/master/db"
  identifier				= "my-name"
  engine    			    = "mysql"
  engine_version 			= "5.7.19"
  ...
  ...
  ...
 }
```

## Required Inputs

The following input variables are required:

## Optional Inputs

The following input variables are optional (have default values):

### allocated\_storage

Description: The allocated storage in gigabytes

Type: `string`

Default: `"5"`

### backup\_window

Description: The daily time range (in UTC) during which automated backups are created if they are enabled. Must not overlap with maintenance_window

Type: `string`

Default: `"03:00-06:00"`

### engine

Description: The database engine to use

Type: `string`

Default: `"mysql"`

### engine\_version

Description: The engine version to use

Type: `string`

Default: `"5.7.19"`

### identifier

Description: The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier

Type: `string`

Default: `"database"`

### instance\_class

Description: The instance type of the RDS instance

Type: `string`

Default: `"db.t2.micro"`

### maintenance\_window

Description: The window to perform maintenance in

Type: `string`

Default: `"Mon:00:00-Mon:03:00"`

### password

Description: Password for the database

Type: `string`

Default: `"password"`

### port

Description: The port on which the DB accepts connections

Type: `string`

Default: `"3306"`

### username

Description: Username for the database

Type: `string`

Default: `"user"`

## Author

Satish Balakrishnan

