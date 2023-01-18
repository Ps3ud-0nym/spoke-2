module "enabled_google_apis" {
  
  depends_on = [
    module.project_factory
  ]
  
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 11.3"

  project_id                  = var.project_id
  disable_services_on_destroy = false

  activate_apis = [
    "cloudbilling.googleapis.com",
    "iam.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "dns.googleapis.com",
    "servicedirectory.googleapis.com"
  ]
}

