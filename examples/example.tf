module "redis" {
  source              = "../"
  name                = "delivops-redis"
  node_type           = "cache.r6g.xlarge"
  allowed_cidr_blocks = ["172.31.0.0/16", "10.0.0.0/16"]
  vpc_id              = "vpc-x"
  subnet_ids          = ["subnet-x", "subnet-x", "subnet-x"]
  engine_version      = "7.0"
}
