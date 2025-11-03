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

variable "public_subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
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