resource "google_storage_bucket" "k8s_bucket" {
  name          = "private-cluster-bucket"
  location      = "US"
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.k8s_bucket.name
  role = "roles/storage.admin"
  member = "allAuthenticatedUsers"
}