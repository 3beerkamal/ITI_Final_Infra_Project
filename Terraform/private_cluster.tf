resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = module.iti.restricted_region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network = module.iti.vpc_id
  subnetwork = module.iti.restricted_id

    private_cluster_config {
        enable_private_endpoint = true
        enable_private_nodes    = true
        master_ipv4_cidr_block  = "172.16.0.0/28"
    }

    master_authorized_networks_config {
        cidr_blocks {
            cidr_block = module.iti.management_cidr
            display_name = "Management CIDR"
        }
    }

    ip_allocation_policy {}

    release_channel {
         channel = "REGULAR"
    }

}

resource "google_container_node_pool" "primary_nodes" {
    name       = "my-node-pool"
    location   = google_container_cluster.primary.location
    cluster    = google_container_cluster.primary.name
    node_count = 3


   management {
        auto_repair  = true
        auto_upgrade = true
    }

    node_config {
        machine_type = "e2-medium"
        disk_type = "pd-standard"
        disk_size_gb = 30

        # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
        service_account = google_service_account.cluster_service_account.email
        oauth_scopes = [
             "cloud-platform"
        ]   
    }

    upgrade_settings {
        max_surge       = 1
        max_unavailable = 0
    }
}
