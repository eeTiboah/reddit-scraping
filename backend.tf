

# update

terraform {
  backend "s3" {
    bucket = lookup(var.backend, terraform.workspace)
    region = "us-east-1"
    key    = "global/s3/terraform.tfstate"
  }
}