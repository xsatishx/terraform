resource "aws_instance" "ec2" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_role}"
  key_name                    = "${var.key_name}"
  subnet_id 		              = "${element(var.subnet_id, count.index)}"
  vpc_security_group_ids      = ["${var.sg_ec2_id}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"
  
  ## Insert EC2 ec2_tags
  tags {
    Name                      = "${element(var.ec2_tag_name, count.index +1)}"
    Company                   = "${var.ec2_tag_company}"
    AppLevel                  = "${var.ec2_tag_applevel}"
    AppName                   = "${var.ec2_tag_appname}"
    Function                  = "${var.ec2_tag_function}"
    AdminName                 = "${var.ec2_tag_adminname}"
    AppType                   = "${var.ec2_tag_apptype}"
  }
}