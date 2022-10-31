resource "google_compute_router" "router" {
  name    = var.router_name
  region  = google_compute_subnetwork.management.region
  network = google_compute_network.iti.id
}

resource "google_compute_router_nat" "nat" {
  name                               = var.router_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = false
    filter = "ERRORS_ONLY"
  }
}