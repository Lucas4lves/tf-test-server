resource "aws_instance" "test-server" {
  instance_type = var.test_server_instance_type
  tags          = var.test_server_tags
  ami           = var.test_server_ami
  region        = var.aws_region
}

module "vpc" {
  source                               = "./vpc"
  test_server_vpc_cidr_block           = var.test_server_vpc_cidr_block
  test_server_vpc_enable_dns_hostnames = var.test_server_vpc_enable_dns_hostnames
  test_server_vpc_enable_dns_support   = var.test_server_vpc_enable_dns_support
  test_server_vpc_tags                 = var.test_server_vpc_tags
}