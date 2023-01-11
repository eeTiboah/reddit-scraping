

resource "aws_s3_bucket" "bucket" {
  bucket        = "gitTerrabucket-100"
  force_destroy = true
}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~>4.0"


  function_name = "web-scraper"
  description   = "Scrape reddit data"
  handler       = "main.handler"
  runtime       = "python3.9"

  source_path = "${path.module}/src/main"
  layers = [
    module.lambda_layer_s3.lambda_layer_arn
  ]
  # store_on_s3 = true
  # s3_bucket   = aws_s3_bucket.bucket.id

  tags = {
    Pattern = "terraform-lambda"
    Module  = "lambda_function"
  }
}

module "lambda_layer_s3" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "~>4.0"

  create_layer = true
  # store_on_s3  = true
  # s3_bucket    = aws_s3_bucket.bucket.id

  layer_name          = "lambda-layer-s3"
  description         = "Lambda layer for the lambda function"
  compatible_runtimes = ["python3.9"]

  runtime = "python3.9"
  source_path = [{
    path             = "${path.module}/src/lambda-layer"
    pip_requirements = true
    prefix_in_zip    = "python"
  }]

  tags = {
    Pattern = "terraform-lambda-layer"
    Module  = "lambda_layer"
  }
}
