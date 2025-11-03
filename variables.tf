variable "test_server_ami" {
  type    = string
  default = ""
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "test_server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "test_server_tags" {
  type = map(string)
  default = {
    "test" = "true"
  }
}

variable "test_server_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "test_server_vpc_enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "test_server_vpc_enable_dns_support" {
  type    = bool
  default = true
}

variable "test_server_vpc_tags" {
  type    = map(string)
  default = {}
}

variable "test_server_vpc_internet_gateway_tags" {
  type    = map(string)
  default = {}
}

variable "route_table_tags" {
  type    = map(string)
  default = {}
}

variable "key_pair_name" {
  type    = string
  default = ""
}

variable "security_group_name" {
  type = string
  default = ""
}