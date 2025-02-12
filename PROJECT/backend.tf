terraform {
  backend "s3" {
    bucket         = "group1-terraform-project"
    key            = "group-1/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}