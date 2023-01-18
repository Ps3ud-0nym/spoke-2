module "psc_subnet" {

  depends_on = [
    module.vpc
  ]
    source  = "terraform-google-modules/network/google//modules/subnets-beta"
    version = "6.0.0"

    project_id   = var.project_id
    network_name = local.network_name

    subnets = [
        {
            subnet_name           = "${local.network_name}-subnet-02"
            subnet_ip             = var.subnet_cidr_02
            subnet_region         = var.primary_region
            purpose               = "PRIVATE_SERVICE_CONNECT"
        }
    ]
}

module "psc_producer" {
  
  depends_on = [
    module.project_factory
  ]
  source = "github.com/Ps3ud-0nym/psc-producer-module.git"

  project_id                          = var.project_id
  primary_region                      = var.primary_region
  service_attachment_name             = var.service_attachment_name
  producer_forwarding_rule_name       = var.producer_forwarding_rule_name
  producer_forwarding_rule_ip_address = var.producer_forwarding_rule_ip_address
  producer_backend_service_name       = var.producer_backend_service_name
  producer_health_check_name          = var.producer_health_check_name
  vpc_name                            = module.vpc.network_name
  subnetwork_name                     = module.vpc.subnets_names[0]
  nat_subnets                         = [module.psc_subnet.subnets["europe-west2/spoke-svpc-02-subnet-02"].id]
  vpc_id                              = module.vpc.network_id
  private_zone_name                   = var.private_zone_name
  private_zone_dns_name               = var.private_zone_dns_name
  private_zone_a_record               = var.private_zone_a_record
  # domain_names                      = var.domain_names
}
