resource "aws_instance" "test-server" {
  instance_type     = var.test_server_instance_type
  tags              = var.test_server_tags
  ami               = var.test_server_ami
  region = var.aws_region
}