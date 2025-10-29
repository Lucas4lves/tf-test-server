resource "aws_instance" "test-server" {
  instance_type     = var.test_server_instance_type
  availability_zone = var.test_server_availability_zone
  tags              = var.test_server_tags
  ami               = var.test_server_ami
}