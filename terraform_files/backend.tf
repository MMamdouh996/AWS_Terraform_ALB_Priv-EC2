terraform {
  backend "s3" {
    bucket                  = "lord-25-1-2023"
    key                     = "terrform.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "/home/mmamdouh/.aws/credentials"
    profile                 = "paularoot"
    dynamodb_table          = "lord-statelock"
  }
}
