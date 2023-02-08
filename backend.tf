

# update

terraform {
  backend "s3" {
    bucket = "github-openid-terraform-1000"
    region = "us-east-1"
    key    = "global/s3/terraform.tfstate"
  }
}

# mm