

terraform {
  backend "s3" {
    bucket = "aws-data-ingestion-project-state"
    region = "eu-central-1"
    key    = "global/s3/terraform.tfstate"
    dynamodb_table = "aws-ingestion-dynamodb"
  }
}
