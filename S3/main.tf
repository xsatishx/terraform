provider "aws" {
  region = "ap-northeast-2"
}

module "s3_bucket" {
  source = "git::https://github.com/cloudposse/terraform-aws-s3-bucket.git?ref=master"

  name      = "${var.name}"
  stage     = "${var.stage}"
  namespace = "${var.namespace}"

  enabled                      = "${var.enabled}"
  versioning_enabled           = "${var.versioning_enabled}"
  allowed_bucket_actions       = "${var.allowed_bucket_actions}"
  acl                          = "${var.acl}"
  allow_encrypted_uploads_only = "${var.allow_encrypted_uploads_only}"
  force_destroy                = "${var.force_destroy}"
  sse_algorithm                = "${var.sse_algorithm}"
  kms_master_key_id            = "${var.kms_master_key_id}"

  tags = {
    "tag_name"      = "${var.tag_name}"
    "tag_company"   = "${var.tag_company}"
    "tag_applevel"  = "${var.tag_applevel}"
    "tag_apptype"   = "${var.tag_apptype}"
    "tag_appname"   = "${var.tag_apptype}"
    "tag_function"  = "${var.tag_function}"
    "tag_adminname" = "${var.tag_adminname}"
  }
}
