// GCS Service Account
resource "google_service_account" "gitlab_gcs" {
  project      = var.project
  account_id   = "gitlab-gcs"
  display_name = "GitLab Cloud Storage"
}

resource "google_service_account_key" "gitlab_gcs" {
  service_account_id = google_service_account.gitlab_gcs.name
}

resource "google_project_iam_member" "project" {
  project = var.project
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.gitlab_gcs.email}"
}
