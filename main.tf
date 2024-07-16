
resource "aws_s3_bucket" "my_bucket" {
  # bucket = "cicd-terraform-git-dev"
  acl  = "private"
}
