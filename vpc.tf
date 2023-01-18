locals {
  network_name = var.vpc_name
}
module "vpc" {

  depends_on = [
    module.enabled_google_apis,
    module.project_factory
  ]

  source  = "terraform-google-modules/network/google"
  version = ">= 4.0.1, < 5.0.0"

  project_id      = var.project_id
  network_name    = local.network_name
  routing_mode    = "GLOBAL"
  # shared_vpc_host = "true"

  subnets = [
    {
      subnet_name           = "${local.network_name}-subnet-01"
      subnet_ip             = var.subnet_cidr_01
      subnet_region         = var.primary_region
      subnet_private_access = true
      description           = "This subnet is managed by Terraform"
    }
  ]
}

