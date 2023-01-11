

resource "aws_s3_bucket" "bucket" {
  bucket        = "bucket-with-lambda-100"
  force_destroy = true
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "web-scraper"
  description   = "Scrape reddit data"
  handler       = "main.handler"
  runtime       = "python3.8"
  attach_cloudwatch_logs_policy           = false
  s3_bucket   = aws_s3_bucket.bucket.id

  source_path = "./src/lambda-function"
  layers = [
    module.lambda_layer_s3.lambda_layer_arn,
  ]
  
  tags = {
    Name = "Data Ingestion Lambda"
  }
}

module "lambda_layer_s3" {
  source = "terraform-aws-modules/lambda/aws"

  create_layer = true

  layer_name          = "lambda-layer-s3"
  description         = "Lambda layer for the lambda function"
  compatible_runtimes = ["python3.8"]

  source_path = "./src/lambda-layer"

  store_on_s3 = true
  s3_bucket   = aws_s3_bucket.bucket.id
}