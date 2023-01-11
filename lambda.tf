

resource "aws_s3_bucket" "bucket" {
  bucket        = "gitTerrabucket-100"
  force_destroy = true
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  version       = "~>4.0"
  

  function_name = "web-scraper"
  description   = "Scrape reddit data"
  handler       = "main.handler"
  runtime       = "python3.9"

  source_path = "${path.module}/src/lambda-function"
  layers = [
    module.lambda_layer_s3.lambda_layer_arn
  ]
  store_on_s3 = true
  s3_bucket   = aws_s3_bucket.bucket.id
  # timeout     = 120
  # memory_size = 128

  # attach_cloudwatch_logs_policy           = false
  # create_current_version_allowed_triggers = false
  # cloudwatch_logs_retention_in_days       = 1
  
  tags = {
    Module = "Data Ingestion Lambda"
  }
}

module "lambda_layer_s3" {
  source = "terraform-aws-modules/lambda/aws"
  version       = "~>4.0"

  create_layer = true
  store_on_s3 = true
  s3_bucket   = aws_s3_bucket.bucket.id

  layer_name          = "lambda-layer-s3"
  description         = "Lambda layer for the lambda function"
  runtime = "python3.9"

  source_path = [{
    path             = "${path.module}/src/lambda-layer"
    pip_requirements = true
    prefix_in_zip = "python"
  }]
}