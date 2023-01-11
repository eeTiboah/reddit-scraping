

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
  description = "The parameter description"
  type        = "SecureString"
  value       = var.secret_key

  tags = {
    environment = "production"
  }
}