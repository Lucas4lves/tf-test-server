module "prometheus-test-server" {
  source                        = "./modules/test-server"
  test_server_availability_zone = var.test_server_availability_zone
  test_server_instance_type     = var.test_server_instance_type
  test_server_tags              = var.test_server_tags
}