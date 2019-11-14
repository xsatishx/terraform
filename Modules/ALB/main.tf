module "ALB" {
  source                   = "terraform-aws-modules/alb/aws"
  version                  = "3.5.0"
  load_balancer_name       = "${var.lb_name}"
  security_groups          = "${var.vpc_security_group_ids}"
  subnets                  = "${var.subnets}"
  vpc_id                   = "${var.vpc_id}"
  http_tcp_listeners       = "${list(map("port", "80", "protocol", "HTTP"))}"
  http_tcp_listeners_count = "1"
  target_groups            = "${list(map("name", "-my-targets", "backend_protocol", "HTTP", "backend_port", "80"))}"
  target_groups_count      = "1"

  logging_enabled = false

  #log_bucket_name     = "cp-dev--s3-bucket-test01"
  #log_location_prefix = "my-alb-logs"

  tags = {
    "Environment"  = "${var.tag_environment}"
    "Company"      = "${var.tag_company}"
    "AppLevel"     = "${var.tag_applevel}"
    "AppType"      = "${var.tag_apptype}"
    "AppName"      = "${var.tag_appname}"
    "Function"     = "${var.tag_function}"
    "AdminName1"   = "${var.tag_adminname1}"
    "AdminName2"   = "${var.tag_adminname2}"
    "EC2StartStop" = "${var.tag_ec2startstop}"
    "EC2Backup"    = "${var.tag_ec2backup}"
    "CreatedBy"    = "${var.tag_createdby}"
  }
}

module "asg" {
  source                       = "terraform-aws-modules/autoscaling/aws"
  version                      = "2.9.1"
  name                         = "${var.autoscaling_group_name}"
  lc_name                      = "-my-lc"
  image_id                     = "${var.ami}"
  instance_type                = "${var.instance_type}"
  key_name                     = "${var.key_name}"
  security_groups              = "${var.vpc_security_group_ids}"
  associate_public_ip_address  = "${var.associate_public_ip_address}"
  recreate_asg_when_lc_changes = "${var.recreate_asg_when_lc_changes}"
  user_data                    = "${var.user_data}"
  asg_name                     = "-my-asg"
  vpc_zone_identifier          = "${var.subnets}"
  health_check_type            = "${var.health_check_type}"
  min_size                     = "${var.min_size}"
  max_size                     = "${var.max_size}"
  desired_capacity             = "${var.min_size}"

  //wait_for_capacity_timeout  = 0
  tags_as_map = {
    "Environment"  = "${var.tag_environment}"
    "Company"      = "${var.tag_company}"
    "AppLevel"     = "${var.tag_applevel}"
    "AppType"      = "${var.tag_apptype}"
    "AppName"      = "${var.tag_appname}"
    "Function"     = "${var.tag_function}"
    "AdminName1"   = "${var.tag_adminname1}"
    "AdminName2"   = "${var.tag_adminname2}"
    "EC2StartStop" = "${var.tag_ec2startstop}"
    "EC2Backup"    = "${var.tag_ec2backup}"
    "CreatedBy"    = "${var.tag_createdby}"
  }
}

resource "aws_autoscaling_attachment" "alb_autoscale" {
  alb_target_group_arn   = "${element(module.ALB.target_group_arns,0)}"
  autoscaling_group_name = "${module.asg.this_autoscaling_group_id}"
}
