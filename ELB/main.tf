provider "aws" {
  region = "ap-northeast-2"
}

module "elb_http" {
  source = "terraform-aws-modules/elb/aws"

  name            = "${var.name}"
  subnets         = "${var.subnets}"
  security_groups = "${var.security_groups}"
  internal        = "${var.internal}"

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = "8080"
      instance_protocol = "HTTP"
      lb_port           = "8080"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = [
    {
      target              = "${var.target}"
      interval            = "${var.hc_interval}"
      healthy_threshold   = "${var.hc_healthy}"
      unhealthy_threshold = "${var.hc_unhealthy}"
      timeout             = "${var.hc_timeout}"
    },
  ]

  number_of_instances = "${var.number_of_instances}"
  instances           = ["${module.ec2_instances.ids}"]
}

module "ec2_instances" {
  # source         = "github.com/xsatishx/terraform/EC2"
  source                 = "./../EC2"
  instance_count         = "${var.number_of_instances}"
  ami                    = "ami-078e96948945fc2c9"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-058aa84cc8c2c2f6f", "sg-f52ab79f"]
  subnet_ids             = ["subnet-64d2ec0c", "subnet-f0325fbc"]
  ebs_count              = "${var.ebs_count}"
}
