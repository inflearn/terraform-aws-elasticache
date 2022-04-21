resource "aws_elasticache_subnet_group" "this" {
  count      = var.subnet_group_name == null ? 1 : 0
  name       = var.name
  subnet_ids = var.subnets
}

resource "aws_elasticache_replication_group" "this" {
  count                      = var.node_groups != null ? 1 : 0
  replication_group_id       = var.name
  subnet_group_name          = coalesce(var.subnet_group_name, try(aws_elasticache_subnet_group.this[0].name, null))
  security_group_ids         = var.security_groups
  engine                     = var.engine
  engine_version             = var.engine_version
  node_type                  = var.instance_type
  port                       = var.port
  parameter_group_name       = var.parameter_group_name
  automatic_failover_enabled = var.automatic_failover_enabled
  num_node_groups            = var.node_groups
  replicas_per_node_group    = var.replicas
  tags                       = var.tags
}

resource "aws_elasticache_cluster" "this" {
  count                = var.nodes != null ? 1 : 0
  cluster_id           = var.name
  subnet_group_name    = coalesce(var.subnet_group_name, try(aws_elasticache_subnet_group.this[0].name, null))
  security_group_ids   = var.security_groups
  engine               = var.engine
  node_type            = var.instance_type
  port                 = var.port
  num_cache_nodes      = var.nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.engine_version
  tags                 = var.tags
}
