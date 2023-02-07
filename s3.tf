

resource "aws_s3_bucket" "terraform_statefile_store"{
    bucket = "terraform-state-files-8700"

    lifecycle {
      prevent_destroy = true # should be true to prevent accidentally deleting state file
    }
    versioning {
      enabled = true
    }
    server_side_encryption_configuration {
      rule{
          apply_server_side_encryption_by_default{
              sse_algorithm = "AES256"
          }
      }
    }
}