

resource "aws_ssm_parameter" "client" {
  name        = "/reddit/client/id"
  description = "The client id for the reddit app"
  type        = "SecureString"
  value       = var.client_id

  tags = {
    environment = "production"
  }
}

resource "aws_ssm_parameter" "secret" {
  name        = "/reddit/secret/key"
  description = "The secret key of app"
  type        = "SecureString"
  value       = var.secret_key

  tags = {
    environment = "production"
  }
}

resource "aws_ssm_parameter" "agent" {
  name        = "/reddit/user/agent"
  description = "The user agent of app"
  value       = var.user_agent
  type        = "SecureString"

  tags = {
    environment = "production"
  }
}