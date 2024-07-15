resource "aws_s3_bucket" "my_bucket" {
  bucket = "cicd-terraform-git-"+ var.github_env.ENVIRONMENT
  acl  = "private"
}
