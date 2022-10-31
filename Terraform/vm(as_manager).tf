resource "google_compute_instance" "iti" {
  name         = var.vm_name
  machine_type = var.vm_image_type
  zone         = var.vm_zone
  allow_stopping_for_update = true

#=========================== boot disk & image details ==========================
  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  // Local SSD disk 
  scratch_disk {
    interface = "SCSI"
  }
#======================== VPC, Subnetwork and static private ip ==================

  network_interface {
    network = module.iti.vpc_id
    subnetwork = module.iti.management_id
    # network_ip = var.vm_ip
  }

#================================== vm service account ==========================

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.vm_service_account.email
    scopes = ["cloud-platform"]
  }

  tags = [ "web" ]
}