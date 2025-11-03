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

variable "key_pair_name" {
  type    = string
  default = ""
}

variable "security_group_id" {
  type    = string
  default = ""
}