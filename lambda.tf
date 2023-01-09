

resource "aws_iam_role" "serverless_role_lambda" {
  name               = "serverless_role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
      "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "web-scraper"
  description   = "Scrape reddit data"
  handler       = "main.handler"
  runtime       = "python3.8"
  lambda_role = aws_iam_role.serverless_role_lambda.arn
  attach_cloudwatch_logs_policy           = false

  source_path = "./src/lambda-function"
  
  tags = {
    Name = "Data Ingestion Lambda"
  }
}