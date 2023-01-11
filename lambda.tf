

resource "aws_s3_bucket" "bucket" {
  bucket        = "bucket-with-lambda-100"
  force_destroy = true
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  version       = "2.33.0"
  

  function_name = "web-scraper"
  description   = "Scrape reddit data"
  handler       = "main.handler"
  runtime       = "python3.8"
  s3_bucket   = aws_s3_bucket.bucket.id

  source_path = "${path.module}/src/lambda-function"
  layers = [
    module.lambda_layer_s3.lambda_layer_arn,
  ]
  store_on_s3 = true
  
  tags = {
    Module = "Data Ingestion Lambda"
  }
}

module "lambda_layer_s3" {
  source = "terraform-aws-modules/lambda/aws"
  version       = "2.33.0"

  create_layer = true

  layer_name          = "lambda-layer-s3"
  description         = "Lambda layer for the lambda function"
  compatible_runtimes = ["python3.8"]

  source_path = [{
    path             = "${path.module}/src/lambda-layer"
    pip_requirements = true
  }]

  store_on_s3 = true
  s3_bucket   = aws_s3_bucket.bucket.id
}