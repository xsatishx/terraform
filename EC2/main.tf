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
  iam_instance_profile   = "${var.iam_instance_profile}"
  key_name               = "${var.key_name}"
  subnet_ids             = "${var.subnet_ids}"

  tags = {
    "tag_name"      = "${var.tag_name}"
    "tag_company"   = "${var.tag_company}"
    "tag_applevel"  = "${var.tag_applevel}"
    "tag_apptype"   = "${var.tag_apptype}"
    "tag_appname"   = "${var.tag_apptype}"
    "tag_function"  = "${var.tag_function}"
    "tag_adminname" = "${var.tag_adminname}"
  }

  root_block_device = [
    {
      volume_size = "${var.root_volume_size}"
      volume_type = "${var.root_volume_type}"
    },
  ]
}

resource "aws_ebs_volume" "volumes" {
  count             = "${var.ebs_count}"
  availability_zone = "${element(module.ec2-instance.availability_zone, count.index)}"
  type              = "${var.ebs_type}"
  size              = "${var.ebs_size}"
}

resource "aws_volume_attachment" "volumes-attachment" {
  count       = "${var.ebs_count}"
  device_name = "${var.block_device_names}"
  volume_id   = "${element(aws_ebs_volume.volumes.*.id, count.index)}"
  instance_id = "${element(module.ec2-instance.id, count.index)}"
}
