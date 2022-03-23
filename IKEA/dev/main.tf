module "gcs-ingest" {
  source  = "app.terraform.io/ancastroo/gcs-ingest/nordcloud"
  version = "0.0.4"

  gcs_transfer = var.gcs_transfer
  source_buckets_list = var.source_buckets_list
  project_id = var.project_id
  end_bucket = google_storage_bucket.end_bucket.name
  end_bucket_name = var.end_bucket_name
  region = var.region
  schedule_year = var.schedule_year
  schedule_month = var.schedule_month
  schedule_day = var.schedule_day
  zone = var.zone

  depends_on = [google_storage_bucket_iam_member.default_sa_transfer_service_bucket_writer]
}