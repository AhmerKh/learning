variable "vpc_id" {
  default = "<vpc-id>"
}

variable "aws_account_id" {
  default = "<account-id>"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "image_repo_name" {
  default = "pipe-demo"
}
variable "image_tag" {
  default = "latest"
}
variable "image_repo_url" {
  default = "<account-id>.dkr.ecr.<region>.amazonaws.com/<repository>"
}
variable "github_repo_owner" {
  default = "AhmerKh"
}
variable "github_repo_name" {
  default = "Hellowithrds"
}
variable "github_branch" {
  default = "main"
}

variable "db_cred" {
  default = {  "username" : "foo",
  "password" : "foobarbaz"
}
}