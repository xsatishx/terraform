# Sample Project for 3-Tier application (ALB + SG + DB)

Terraform which creates ALB, Security Group and RDS resources on AWS.

**Note** : For all variables those having value assigned are based on the testing on AWS environment. Please make change them to match the values of target AWS environment.

## Description

Provision [ALB](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html),
[Security Groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-update-security-groups.html) and
[DB Instance](https://www.terraform.io/docs/providers/aws/r/db_instance.html)

This module provides recommended settings:

- ALB
- SG
- RDS

## Usage

You can call the module to run it with all the defaults or specify the 
variables as shown below to modify the defaults.


```hcl
module "ec2" {
  source = "../Modules/EC2"
  ...
  ...
}

module "alb" {
  source             = "../Modules/ALB"
  name               = "${var.name}"
  vpc_id             = "${var.vpc_id}"
  subnets            = ["${var.subnets}"]
  ami                = "${var.ami}"
  ...
  ...
}

module "sg" {
  source             = "../Modules/SG"
  name   			 = "${var.name}"
  vpc_id 			 = "${var.vpc_id}"
  ...
  ...
 }

module "db" {
  source             = "../Modules/RDS/MYSQL"
  identifier         = "${var.identifier}"
  username           = "${var.username}"
  password           = "${var.password}"
  ...
  ...
}
```

## Author

Satish Balakrishnan