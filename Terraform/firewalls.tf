resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh-connection"
  network = module.iti.vpc_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
