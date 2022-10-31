
output "management_id" {
  value = google_compute_subnetwork.management.id
}

output "management_cidr" {
  value = google_compute_subnetwork.management.ip_cidr_range
}

output "restricted_cidr" {
  value = google_compute_subnetwork.restricted.ip_cidr_range
}

output "restricted_id" {
  value = google_compute_subnetwork.restricted.id
}

output "restricted_region" {
  value = google_compute_subnetwork.restricted.region
}

output "vpc_id" {
  value = google_compute_network.iti.id
}

output "vpc_name" {
  value = google_compute_network.iti.name
}