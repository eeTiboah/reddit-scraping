
output "lambda_arn" {
  value       = module.lambda_function.lambda_function_arn
  description = "Lambda function ARN"
}

output "lambda_arn" {
  value       = module.lambda_function.lambda_function_url
  description = "Lambda function URL"
}