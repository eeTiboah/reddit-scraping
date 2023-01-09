


module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "web-scraper"
  description   = "Scrape reddit data"
  handler       = "main.handler"
  runtime       = "python3.8"
  attach_cloudwatch_logs_policy           = false

  source_path = "./src/lambda-function"
  
  tags = {
    Name = "Data Ingestion Lambda"
  }
}