output "vm_ip" {
    value = google_compute_instance.iti.network_interface.0.network_ip
}
