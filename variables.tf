variable "target_service_account_id" {
  description = "Service account to rotate keys for. Folder terraformer or folder terraform planner"
  type        = string
}

variable "repo_environment" {
  description = "Repository environment to store the service account key in. Example: dev"
  type        = string
}

variable "environment_secret_name" {
  description = "Name of the repo environment secret"
  type        = string
  default     = "GCP_KEY"
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

variable "cron_expresssion" {
  description = "cron expression used for scheduler to trigger the job. since this is run through terraform's formatdate() function, letters can be used for the values to get the current date/time (+<cron_offset>)"
  # run in <cron_minute_offset> minutes, and then every 24 hours after that
  default = "m h * * *"
  type    = string
}

variable "cron_offset" {
  description = "Time to add to the current timestamp when evaluating the cron expression. Must be a valid argument to terraform's timeadd() function"
  default     = "5m"
  type        = string
}

variable "key_ttl_seconds" {
  description = "How long the service account key should live. Ensure this is compatible with the cron expression and any rotation buffer needed"
  default     = 90000
  type        = number
}
