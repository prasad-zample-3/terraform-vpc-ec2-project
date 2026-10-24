provider "aws" {
  region = "ap-south-2"
  }

 resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
 }

module "myapp-subnet" {
  source = "./modules/subnet"
  vpc_id = aws_vpc.myapp-vpc.id
  env_prefix = var.env_prefix
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone = var.avail_zone

}

module "myapp-webserver" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.myapp-vpc.id
  env_prefix = var.env_prefix
  my-ip = var.my-ip
  instance_type = var.instance_type
  avail_zone = var.avail_zone
  my_public_key_location = var.my_public_key_location
  subnet_id = module.myapp-subnet.subnet.id
}



