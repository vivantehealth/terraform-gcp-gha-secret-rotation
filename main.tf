# Create a scheduled job to handle key rotation for the environment secret
resource "google_cloud_scheduler_job" "rotate_key" {
  schedule    = formatdate(var.cron_expresssion, timeadd(timestamp(), var.cron_offset))
  name        = "rotate-key"
  description = "rotate the gcp keys in github actions environment secrets"
  project     = var.project
  lifecycle {
    ignore_changes = [schedule]
  }
  pubsub_target {
    topic_name = var.topic_id
    attributes = {
      repo                  = var.repo
      repoEnvironment       = var.repo_environment
      serviceAccount        = var.target_service_account_id
      environmentSecretName = var.environment_secret_name
      keyTtlSeconds         = var.key_ttl_seconds
    }
  }
}

# Allow the cloud function to rotate keys
resource "google_service_account_iam_member" "sa_rotate_key" {
  service_account_id = var.target_service_account_id
  role               = "roles/iam.serviceAccountKeyAdmin"
  member             = "serviceAccount:${var.cf_runtime_service_account_email}"
}
