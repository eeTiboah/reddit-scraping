
variable "lambda_bucket" {
    type = map
    default = {
        "dev": "terraformbucket-x-1000"
        "prod": "lambterrabuck100"
    }
}



