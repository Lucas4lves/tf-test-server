# =======================================================
# GENERAL CONFIG
# =======================================================
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# =======================================================
# EC2 CONFIG
# =======================================================
variable "test_server_ami" {
  type    = string
  default = ""
}

variable "test_server_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_pair_name" {
  type    = string
  default = ""
}

# =======================================================
# SECURITY GROUP CONFIG
# =======================================================
variable "security_group_name" {
  type    = string
  default = ""
}

# =======================================================
# NETWORKING CONFIG
# =======================================================
variable "test_server_vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

# =======================================================
# RESOURCES TAGGING
# =======================================================
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

variable "test_server_tags" {
  type = map(string)
  default = {
    "test" = "true"
  }
}

