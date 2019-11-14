# AWS VPC Terraform Module 

Terraform module which creates VPC resources on AWS.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)
* [Subnet](https://www.terraform.io/docs/providers/aws/r/subnet.html)
* [Route](https://www.terraform.io/docs/providers/aws/r/route.html)
* [Route table](https://www.terraform.io/docs/providers/aws/r/route_table.html)
* [Internet Gateway](https://www.terraform.io/docs/providers/aws/r/internet_gateway.html)
* [Network ACL](https://www.terraform.io/docs/providers/aws/r/network_acl.html)
* [NAT Gateway](https://www.terraform.io/docs/providers/aws/r/nat_gateway.html)
* [VPN Gateway](https://www.terraform.io/docs/providers/aws/r/vpn_gateway.html)

## Usage

Call the vpc module and specify a valid CIDR. 
By default, if NAT Gateways are enabled, private subnets will be configured with routes for Internet traffic
that point at the NAT Gateways configured by use of the above options.If you need private subnets that should have no Internet routing intra_subnets should be used instead.

```hcl
module "vpc" {
  source = "https://github.com/xsatishx/terraform/vpc"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  intra_subnets   =["..."]
  ...
  ...
  ...
}
```

## Required Inputs

### azs

Description: A list of availability zones in the region

Type: `list`

Default: `<list>`

### cidr

Description: The CIDR block for the VPC.

Type: `string`

Default: `"10.0.0.0/16"`

### name

Description: Name to be used on all the resources as identifier

Type: `string`

Default: `"custom-vpc"`

### private\_subnets

Description: A list of private subnets inside the VPC

Type: `list`

Default: `<list>`

### public\_subnets

Description: A list of public subnets inside the VPC

Type: `list`

Default: `<list>`

The following input variables are required:

## Optional Inputs

The following input variables are optional (have default values):



### tag\_environment

Description: Tag name to be assigned to the instance

Type: `string`

Default: `"dev"`

### tag\_name

Description: Tag name to be assigned to the instance

Type: `string`

Default: `"My-VPC"`

## Outputs

The following outputs are exported:

### intra\_subnets

Description: List of IDs of intra subnets

### public\_subnets

Description: List of IDs of public subnets

### vpc\_id

Description: The ID of the VPC

## Author

Satish Balakrishnan 
