provider "aws" {
  region = "ap-northeast-2"
}

module "ec2-instance" {
  //https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/1.19.0
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "1.19.0"
  instance_count         = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  name                   = "${var.name}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  key_name               = "${var.key_name}"
  subnet_ids             = "${var.subnet_ids}"
  user_data              = "${var.user_data}"
  associate_public_ip_address  = true
  iam_instance_profile = "${var.iam_instance_profile}"

  tags = {
    "tag_environment"  = "${var.tag_environment}"
    "tag_adminname"   = "${var.tag_adminname}"
    "tag_createdby"    = "${var.tag_createdby}"
  }

  root_block_device = [
    {
      volume_size = "${var.root_volume_size}"
      volume_type = "${var.root_volume_type}"
    },
  ]
}
