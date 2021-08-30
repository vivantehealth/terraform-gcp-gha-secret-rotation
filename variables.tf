variable "target_service_account_id" {
  description = "Service account to rotate keys for. Folder terraformer or folder terraform planner"
  type        = string
}

variable "repo_environment" {
  description = "Repository environment to store the service account key in. Example: dev"
  type        = string
}

variable "repo" {
  description = "GitHub repository that needs the service account key. Is usually either gcp-env-terraform or gcp-tools-terraform"
  type        = string
}

variable "topic_id" {
  description = "PubSub topic id for key rotation messages to trigger the cloud function"
  type        = string
}

variable "project" {
  description = "GCP project where the service account exists. Probably <env>-terraform"
  type        = string
}

variable "cf_runtime_service_account_email" {
  description = "Service account that the key-rotator cloud function runs as"
  type        = string
}
