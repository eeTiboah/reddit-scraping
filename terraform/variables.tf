
# variable "lambda_bucket" {
#     type = map
#     default = {
#         "dev": "terraformbucket-x-1000"
#         "prod": "lambterrabuck100"
#     }
# }

variable "reddit_api_secret_key" {
  default     = ""
  type        = string
  description = "This is the secret key of the reddit app we will use to scrape the data"
  sensitive = true
}

variable "reddit_api_client_id" {
  default     = ""
  type        = string
  description = "This is the client id of the reddit app we will use to scrape the data"
  sensitive = true
}

variable "reddit_api_user_agent" {
  default     = ""
  type        = string
  description = "This is the user agent of the reddit app we will use to scrape the data"
  sensitive = true
}