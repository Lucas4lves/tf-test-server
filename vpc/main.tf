resource "aws_vpc" "this" {
  cidr_block           = var.test_server_vpc_cidr_block
  enable_dns_hostnames = var.test_server_vpc_enable_dns_hostnames
  enable_dns_support   = var.test_server_vpc_enable_dns_support

  tags = var.test_server_vpc_tags
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = var.test_server_vpc_internet_gateway_tags
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr_block
  map_public_ip_on_launch = true
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = var.route_table_tags
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

# Outputs => used by security group module
output "vpc_id" {
  value = aws_vpc.this.ipv6_association_id
}