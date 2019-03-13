resource "aws_instance" "ec2" {
  ami                  = "${var.ami}"
  instance_type        = "${var.instance_type}"
  iam_instance_profile = "${var.iam_role}"
  key_name             = "${var.key_name}"
  subnet_id            = "${element(var.subnet_id, count.index)}"

  associate_public_ip_address = "${var.associate_public_ip_address}"

  ## Insert EC2 ec2_tags
  tags {
    Name      = "${var.tag_name, count.index +1}"
    Company   = "${var.tag_company}"
    AppLevel  = "${var.tag_applevel}"
    AppName   = "${var.tag_appname}"
    Function  = "${var.tag_function}"
    AdminName = "${var.tag_adminname}"
    AppType   = "${var.tag_apptype}"
  }
}
