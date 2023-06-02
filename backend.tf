# For AWS, terraform will throw an error if the bucket does not exist.
# For GCP, if the service account has enough credentials, the bucket will be created.
terraform {
  backend "s3" {
    # bucket names are unique within AWS region across all accounts
    bucket  = "tj-terraform-state-files"
    key     = "aws-terraform-helloworld"
    region  = "eu-west-3"
    profile = "aws-helloworld"
  }
}
