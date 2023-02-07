
variable "lambda_bucket" {
    type = map
    default = {
        "env": "terraformbucket-x-1000"
        "prod": "lambterrabuck100"
    }
}


variable "backend" {
    type = map
    default =  {
        "env": "github-openid-terraform-1000"
        "prod": "cloudprojbucketstate"
    }
}
