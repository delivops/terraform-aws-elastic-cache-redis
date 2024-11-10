resource "aws_security_group" "redis-security-group" {
  name        = "${var.name}-redis-sg"
  description = "Security group for ${var.name} Redis cluster"

  dynamic "ingress" {
    for_each = var.allowed_cidr_blocks
    iterator = cidr_blocks

    content {
      from_port   = 6379
      to_port     = 6379
      protocol    = "tcp"
      cidr_blocks = [cidr_blocks.value]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  vpc_id = var.vpc_id
}

resource "aws_elasticache_subnet_group" "redis-cluster" {
  name       = "${var.name}-redis-sbg"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "redis-cluster" {
  cluster_id               = "${var.name}-redis-cluster"
  node_type                = var.node_type
  engine                   = "redis"
  engine_version           = var.engine_version
  num_cache_nodes          = var.node_count
  security_group_ids       = [aws_security_group.redis-security-group.id]
  subnet_group_name        = aws_elasticache_subnet_group.redis-cluster.name
  apply_immediately        = true
  snapshot_retention_limit = var.snapshot_retention_limit
}