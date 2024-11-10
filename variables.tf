
variable "name" {
  type        = string
  description = "The redis cluster name"
}

variable "node_type" {
  type        = string
  description = "Node type for the redis instances (default: cache.t4g.micro)"
  default     = "cache.t4g.micro"
}

variable "node_count" {
  type        = number
  description = "Number of instances for this cluster"
  default     = 1
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "allowed cidr blocks to access the cluster"
}

variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "subnet_ids" {
  type = list(string)
}

variable "snapshot_retention_limit" {
  type    = number
  default = 0
}

variable "engine_version" {
  type = string
}
