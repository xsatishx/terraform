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

module "ec2_instance" {
  source                 = "github.com/xsatishx/terraform/Modules/EC2"
  iam_instance_profile =  "${aws_iam_instance_profile.test_profile.name}"
  tag_environment  = "${var.tag_environment}"
  tag_adminname   = "${var.tag_adminname}"
  tag_createdby    = "${var.tag_createdby}"
}