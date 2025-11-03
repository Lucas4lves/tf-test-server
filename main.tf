module "instance" {
  source                    = "./instance"
  test_server_ami           = var.test_server_ami
  test_server_instance_type = var.test_server_instance_type
  test_server_tags          = var.test_server_tags
  aws_region                = var.aws_region
  key_pair_name             = var.key_pair_name
  security_group_id         = module.security_group.security_group_id
}

module "vpc" {
  source                               = "./vpc"
  test_server_vpc_cidr_block           = var.test_server_vpc_cidr_block
  test_server_vpc_tags                 = var.test_server_vpc_tags
}

module "security_group" {
  source              = "./security-groups"
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.security_group_name
}