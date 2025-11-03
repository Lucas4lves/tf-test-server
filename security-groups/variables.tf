variable "aws_region" {
  type = string
  default = "us-east-1"
}
variable "vpc_id" {
  type = string
  default = ""
}

variable "security_group_name" {
  type = string
  default = ""
}

variable "ssh_connection_source_ip_cidr" {
  type = string
  default = ""
}