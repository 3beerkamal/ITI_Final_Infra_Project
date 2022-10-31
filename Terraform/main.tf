module "iti" {
  source = "./network"

  project_id = var.project_id
  router_name = var.router_name
  #=================== Management subnet Arguments ===================

  management_name = var.management_name
  management_region = var.management_region
  management_cidr = var.management_cidr

  #=================== restricted subnet Arguments ===================

  restricted_name = var.restricted_name
  restricted_region = var.restricted_region
  restricted_cidr = var.restricted_cidr
}