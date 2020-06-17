provider "aws" {
  region = "eu-west-1"
}

module "vpc-wsc" {

  source  = "WeScale/vpc/aws"
  version = "1.0.0"


  group                = "test"
  env                  = "dev"
  owner                = "github"
  firstname            = "antonio"
  lastname             = "josef"
  region               = "eu-west-1"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_count  = "1"
  private_subnet_count = "1"
  cidr_block_private   = ["10.0.1.0/24"]
  cidr_block_public    = ["10.0.2.0/24"]
}


module "autoscale_group" {

  source  = "WeScale/asg/aws"
  version = "1.0.0"
  name = "test"
  max_size            = "5"
  min_size            = "2"
  desired_capacity    = "3"
  vpc_zone_identifier = module.vpc-wsc.private_subnet_ids
  ami                 = "ami-5bdafa2c"
  name_config         = "test"
  instance_type       = "t2.micro"
}

