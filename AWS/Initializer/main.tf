provider "aws" {
  region           = "us-west-1"
  profile          = "personal"
}

variable "jamulus_terraform_state_bucket_name" {
  type = string
  default = "terraform-jamulus"
}

resource "aws_s3_bucket" "jamulus_terraform_state_bucket" {
    bucket = var.jamulus_terraform_state_bucket_name
    region = "us-west-1"
}

resource "aws_dynamodb_table" "jamulus_terraform_state_dynamodb" {
    name = "terraform-jamulus"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"
    attribute {
      name = "LockID"
      type = "S"
    }
}
