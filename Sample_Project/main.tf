provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "https://github.com/xsatishx/terraform/Modules/vpc"
}

module "EC2" {
  source = "https://github.com/xsatishx/terraform/Modules/EC2"
}

module "db" {
  source = "https://github.com/xsatishx/terraform/Modules/MYSQL"
}
