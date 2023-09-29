provider "aws" {
  region  = "ap-northeast-1"
  profile = local.profile[terraform.workspace]
}

data "aws_caller_identity" "current" {}