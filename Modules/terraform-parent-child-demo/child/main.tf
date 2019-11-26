module "ec2-instance" {
  source                 = "../EC2"
   instance_type          = "${var.instance_type_sel["${var.instance_type}"]}"

}