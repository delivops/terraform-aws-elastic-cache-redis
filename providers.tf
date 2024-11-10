terraform {
  required_providers {
    aws = {
      version = ">= 4.67.0"
    }
  }
}

data "aws_partition" "current" {}
data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}
