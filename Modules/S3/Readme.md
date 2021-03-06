# AWS S3 Terraform Module 

This module creates an S3 bucket with support of versioning, encryption, ACL and bucket object policy

## Usage

```hcl
module "s3_bucket" {
  source                   = "git::https://github.com/cloudposse/terraform-aws-s3-bucket.git?ref=master"
  name                     = "${var.name}"
  stage                    = "${var.stage}"
  namespace                = "${var.namespace}"
  ...
  ...
  ...
}
```
## Required Inputs

The following input variables are required:

## Optional Inputs

The following input variables are optional (have default values):

### acl

Description: The canned ACL to apply. Always use `private` when possible to avoid exposing sensitive information

Type: `string`

Default: `"private"`

### allow\_encrypted\_uploads\_only

Description: Set to `true` to prevent uploads of unencrypted objects to S3 bucket

Type: `string`

Default: `"false"`

### allowed\_bucket\_actions

Description: List of actions the user is permitted to perform on the S3 bucket

Type: `list`

Default: `<list>`

### enabled

Description: Set this to false if you dont have to create a resource but want to modify its properties

Type: `string`

Default: `"true"`

### force\_destroy

Description: If true it indicates all objects should be forced delete from the bucket so that the bucket can be deleted without an error

Type: `string`

Default: `"false"`

### kms\_master\_key\_id

Description: The AWS KMS master key ID used for the `SSE-KMS` encryption. This can only be used when you set the value of  variable sse_algorithm as aws:kms

Type: `string`

Default: `""`

### name

Description: Name to be used on all the resources as identifier

Type: `string`

Default: `"SCB-s3-bucket-test01"`

### namespace

Description:

Type: `string`

Default: `"cp"`

### sse\_algorithm

Description: The server-side encryption algorithm to use. Valid values are AES256 and aws:kms

Type: `string`

Default: `"AES256"`

### stage

Description: The environment this bucket is used for

Type: `string`

Default: `"dev"`

### tag\_adminname

Description: Tag the instance with the admins name

Type: `string`

Default: `"admin"`

### tag\_applevel

Description: Tag the instance with the app level

Type: `string`

Default: `"4"`

### tag\_appname

Description: Tag the instance with the app name

Type: `string`

Default: `"RPS"`

### tag\_apptype

Description: Tag the instance with the app type

Type: `string`

Default: `"webapp"`

### tag\_company

Description: Company name to be tagged to the instance

Type: `string`

Default: `"SCB"`

### tag\_function

Description: Tag the instance with the app function

Type: `string`

Default: `"Dev"`

### tag\_name

Description: Tag name to be assigned to the instance

Type: `string`

Default: `"app"`

### versioning\_enabled

Description: Versioning is a means of keeping multiple variants of an object in the same bucket. Set it to true if you want backups

Type: `string`

Default: `"true"`

## Outputs

The following outputs are exported:

### access\_key\_id

Description: The access key id

### bucket\_arn

Description: Bucket ARN

### bucket\_domain\_name

Description: FQDN of the bucket

### bucket\_id

Description: The bucket id or name

## Author

Satish Balakrishnan 
