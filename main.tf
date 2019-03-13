provider "aws" {
  region = "ap-northeast-2"
}

module "EC2" {
  source = "git::https://github.com/xsatishx/terraform.git//Modules/EC2"
}
