variable "environment_var" {
  description = "The environment (dev, prod)"
  type = string
  default = var.TF_ENV
}
# # Access the environment variable passed from the workflow
# variable environment_var = var.TF_ENV

resource "aws_s3_bucket" "my_bucket" {
  # bucket = "cicd-terraform-git-dev"
  bucket = format("%s-my-bucket", environment_var)
  acl  = "private"
}
