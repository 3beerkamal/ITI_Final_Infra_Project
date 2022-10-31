
#====================== Managemanet Subnet ====================

resource "google_compute_subnetwork" "management" {
  name          = var.management_name
  ip_cidr_range = var.management_cidr
  region        = var.management_region
  private_ip_google_access = true
  network       = google_compute_network.iti.id
  
}

#====================== restricted Subnet ====================

resource "google_compute_subnetwork" "restricted" {
  name          = var.restricted_name
  ip_cidr_range = var.restricted_cidr
  region        = var.restricted_region
  private_ip_google_access = true
  network       = google_compute_network.iti.id
  
}