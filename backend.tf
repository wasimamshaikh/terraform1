terraform {
  backend "s3" {
    bucket = "web-terra-jen1"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}