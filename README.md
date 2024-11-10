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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.redis-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_subnet_group.redis-cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.redis-security-group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_cidr_blocks"></a> [allowed\_cidr\_blocks](#input\_allowed\_cidr\_blocks) | allowed cidr blocks to access the cluster | `list(string)` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The redis cluster name | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of instances for this cluster | `number` | `1` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | Node type for the redis instances (default: cache.t4g.micro) | `string` | `"cache.t4g.micro"` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | n/a | `number` | `0` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | n/a | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->