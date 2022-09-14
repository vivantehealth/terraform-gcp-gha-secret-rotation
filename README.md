# terraform-gcp-gha-secret-rotation
Provisions a job that periodically publishes a pubsub message with the specified payload. This is used along with the environment's key-rotation cloud function to rotate service account keys and place them in a repo's environment secrets.

The code for the key-rotation cloud function is in the [gcp-org-terraform](https://github.com/vivantehealth/gcp-org-terraform/vivante-environment/key-rotator) repo

## Development
During development, the module can be referenced with the following syntax

```
  source = "github.com/vivantehealth/terraform-gcp-gha-secret-rotation?ref=<commit-sha>"
```

When merging a PR, a release is created, bumping the patch version by default. To bump the minor or major version, ensure that the head commit of the PR contains the text `#minor` or `#major`.
