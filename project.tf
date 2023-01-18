# resource "google_project" "spoke-project" {
#   name            = var.project_name
#   project_id      = var.project_id
#   billing_account = var.billing_account_id
# }

# Using this module enables default deletion of default network, default compute SA etc
module "project_factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.1"

  name                 = var.project_name
  project_id           = var.project_id
  billing_account      = var.billing_account_id
  org_id               = var.organization_id
}