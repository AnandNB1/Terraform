resource "aws_s3_bucket" "my_bucket" {
  bucket = "cicd_terraform_git_dev"
  acl  = "private"
}
