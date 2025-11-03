resource "aws_security_group" "this" {
  region = var.aws_region
  name = var.security_group_name
  description = "Security group to enable ingress and egress traffic to an EC2 instance"
  vpc_id = var.vpc_id
} 

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.this.id
  ip_protocol = "tcp"
  from_port = "22"
  to_port = "22"
  cidr_ipv4 = var.ssh_connection_source_ip_cidr
}

resource "aws_vpc_security_group_egress_rule" "internet" {
  security_group_id = aws_security_group.this.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

output "security_group_id" {
  value = aws_security_group.this.id
}