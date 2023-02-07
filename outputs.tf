
output "lambda_arn" {
  value       = module.lambda_function.lambda_function_arn
  description = "Lambda function ARN"
}

output "lambda_url" {
  value       = module.lambda_function.lambda_function_url
  description = "Lambda function URL"
}

output "lambda_date" {
  value       = module.lambda_function.lambda_layer_created_date
  description = "Lambda function date"
}