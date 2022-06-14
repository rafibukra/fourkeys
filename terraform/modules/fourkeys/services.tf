locals {
  services = var.enable_apis ? [
    "cloudbuild.googleapis.com"
  ] : []
}

resource "google_project_service" "fourkeys_services" {
  for_each                   = toset(local.services)
  project                    = var.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = false
}