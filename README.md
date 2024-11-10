# terraform-aws-elasticache-redis

This module creates a Redis cluster on AWS using ElastiCache, including a security group and a subnet group.

## Installation

To use this module, you need to have Terraform installed. You can find installation instructions on the Terraform website.

## Usage

This example shows a basic configuration with one Redis node, accessible from a specified CIDR block:

Include this repository as a module in your existing terraform code:

```hcl
################################################################################
# AWS Elasticache-redis
################################################################################

module "redis" {
  source              = "delivops/elasticache-redis/aws"
  version             = "x.x.x"
  name                = "delivops-redis"
  node_type           = "cache.r6g.xlarge"
  allowed_cidr_blocks = ["172.31.0.0/16", "10.0.0.0/16"]
  vpc_id              = "vpc-x"
  subnet_ids          = ["subnet-x", "subnet-x", "subnet-x"]
  engine_version      = "7.0"
}
```

## information

1. Time to create an elasticache-redis is around 10 minutes.
2. Ensure that the vpc_id and subnet_ids correspond to the VPC and subnets in your AWS account.
3. Adjust the node_type and node_count according to your performance and scaling requirements.

## License

MIT
