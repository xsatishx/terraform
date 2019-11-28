provider "aws" {
  region = "ap-northeast-2"
}

// creating an AWS IAM role
resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

// Creating an AWS IAM policy
resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}

//Attaching the policy to the role
resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

// Creating the IAM instance profile 
resource "aws_iam_instance_profile" "test_profile" {
  name  = "test_profile"
  roles = ["${aws_iam_role.ec2_s3_access_role.name}"]
}

/*module "vpc" {
  source           = "github.com/xsatishx/terraform/Modules/vpc"
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"
}



module "db" {
  source                 = "github.com/xsatishx/terraform/Modules/DB"
  identifier             = "testprojectdb"
  vpc_security_group_ids = ["${module.vpc.vpc_security_group_ids}"]
  subnet_ids             = ["${module.vpc.intra_subnets}"]
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"
}
*/
module "ec2_instance" {
  source                 = "github.com/xsatishx/terraform/Modules/EC2"
  associate_public_ip_address  = true
  iam_instance_profile =  "${aws_iam_instance_profile.test_profile.name}"
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"

  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  subnet_ids             = "${var.subnet_ids}"
  associate_public_ip_address  = true
}