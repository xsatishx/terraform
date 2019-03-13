provider "aws" {
  region = "ap-northeast-2"
}

module "EC2" {
  source        = "git::https://github.com/xsatishx/terraform.git//Modules/EC2"
  tag_name      = "Satish"
  tag_company   = "Satish"
  tag_applevel  = "1"
  tag_function  = "Test"
  tag_apptype   = "NewApp"
  tag_appname   = "MyApp"
  tag_adminname = "Satish"
}
