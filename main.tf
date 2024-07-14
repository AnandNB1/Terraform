resource "aws_s3_bucket" "my_bucket" {
  bucket = "CICD_Terraform_Git_Dev"
  acl  = "private"
}
