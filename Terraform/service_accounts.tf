#========================= VM Service account ===================

resource "google_service_account" "vm_service_account" {
  account_id   = var.vm_service_account_id
  display_name = var.vm_service_account_name
}

#========================= Cluster nodes Service account ===================

resource "google_service_account" "cluster_service_account" {
  account_id   = var.cluster_service_account_id
  display_name = var.cluster_service_account_name
}