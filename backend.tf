terraform {
  backend "s3" {
    bucket = "our-terraform-tfstate-file-sathichi-bucket"
    key    = "ours/terraform.tfstate"
    region = "ap-south-1"
  }
}

