# AWS ALB module

Terraform module which creates ALB resources on AWS.

## Description

Provision [ALB](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html),
[ALB Listeners](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-listeners.html),
[Target Groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-target-groups.html) and
[Security Groups](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-update-security-groups.html).

This module provides recommended settings:

- Enable HTTPS
- Enable HTTP/2
- Enable Access Logging
- Enable Deletion Protection
- Enable HTTP to HTTPS redirect
- Use AWS recommended SSL Policy

## Usage

```hcl
module "alb" {
  source             = "git::https://github.com/tmknom/terraform-aws-alb.git?ref=tags/1.5.1"
  name               = "minimal"
  vpc_id             = "${var.vpc_id}"
  subnets            = ["${var.subnets}"]
  ...
  ...
}
```

## Inputs

# Required Inputs
 
The following input variables are required:
 
### ami
 
Description: Amazon Machine ID used for provisioning the instance
 
Type: `string`
 
### instance\_type
 
Description:
 
Type: `string`
 
### key\_name
 
Description:
 
Type: `string`
 
### subnets
 
Description:
 
Type: `list`
 
### tag\_adminname1
 
Description: Tag the instance with the admins name
 
Type: `string`
 
### tag\_adminname2
 
Description: Tag the instance with the admins name
 
Type: `string`
 
### vpc\_id
 
Description:
 
Type: `string`
 
### vpc\_security\_group\_ids
 
Description:
 
Type: `list`
 
## Optional Inputs
 
The following input variables are optional (have default values):
 
### associate\_public\_ip\_address
 
Description:
 
Type: `string`
 
Default: `"false"`
 
### autoscaling\_group\_name
 
Description:
 
Type: `string`
 
Default: `"-autoscaling-instance"`
 
### health\_check\_type
 
Description:
 
Type: `string`
 
Default: `"EC2"`
 
### lc\_name
 
Description:
 
Type: `string`
 
Default: `"-launch-configuration"`
 
### load\_balancer\_name
 
Description:
 
Type: `string`
 
Default: `"-application-load-balancer"`
 
### max\_size
 
Description:
 
Type: `string`
 
Default: `"4"`
 
### min\_size
 
Description:
 
Type: `string`
 
Default: `"3"`
 
### recreate\_asg\_when\_lc\_changes
 
Description:
 
Type: `string`
 
Default: `"true"`
 
### tag\_applevel
 
Description: Tag the instance with the app level
 
Type: `string`
 
Default: `"0"`
 
### tag\_appname
 
Description: Tag the instance with the app name
 
Type: `string`
 
Default: `""`
 
### tag\_apptype
 
Description: Tag the instance with the app type
 
Type: `string`
 
Default: `"nonprod"`
 
### tag\_company
 
Description: Company name to be tagged to the instance
 
Type: `string`
 
Default: `""`
 
### tag\_createdby
 
Description: To specify how this instance was created
 
Type: `string`
 
Default: `"terraform"`
 
### tag\_ec2backup
 
Description: Tag the instance with ec2 backup details
 
Type: `string`
 
Default: `"dev-2M"`
 
### tag\_ec2startstop
 
Description: Tag the instance ec2 start and stop time and date
 
Type: `string`
 
Default: `"Mon-Fri_07:00-21:00"`
 
### tag\_environment
 
Description: Tag name to be assigned to the instance
 
Type: `string`
 
Default: `"dev"`
 
### tag\_function
 
Description: Tag the instance with the app function
 
Type: `string`
 
Default: `"app"`
 
### user\_data
 
Description: Enter any user data here
 
Type: `string`
 
Default: `" "`
 
## Outputs
 
The following outputs are exported:
 
### dns\_name
 
Description: DNS name of the Load balancer
 
### target\_group\_arns
 
Description: The arn of the target groups
 

## Outputs

| Name                                    | Description                                                                                |
| --------------------------------------- | ------------------------------------------------------------------------------------------ |
| alb_arn                                 | The ARN of the load balancer (matches id).                                                 |
| alb_dns_name                            | The DNS name of the load balancer.                                                         |


## Author

Satish Balakrishnan