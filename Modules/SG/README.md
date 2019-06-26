# AWS Security Group Terraform Module

This module creates a security group with ingress and egress ruls

## Usage

```hcl
module "sg" {
  source = "../../SG"
  name   = "${var.name}"
  vpc_id = "${var.vpc_id}"

  tag_appname        = "${var.tag_appname}"
  tag_adminname1     = "${var.tag_adminname1}"
  tag_createdate     = "${var.tag_createdate}"
  tag_lastmodifydate = "${var.tag_createdate}"
  
  ...
  }
```

## Required Inputs

The following input variables are required:

### name

Description: The name of security group

Type: `string`

### vpc_id

Description: The ID of the VPC.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### ingress_with_cidr_blocks 

Description: 

Type: `list`

Default: []

### egress_with_cidr_blocks

Description: 

Type: `list`

Default: 
`[{`
      `from_port   = 0`
      `to_port     = 0`
      `protocol    = "-1"`
      `description = "All Traffic"`
      `cidr_blocks = "0.0.0.0/0"`
    `},`
  ]`

## Outputs

The following outputs are exported:

### this_security_group_description

Description: The description of the security group

### this_security_group_id

Description: The ID of the security group

### this_security_group_name

Description: The name of the security group

### this_security_group_owner_id

Description: The owner ID of the security group

### this_security_group_vpc_id

Description: The VPC ID




## Author

Bernd Nordhausen