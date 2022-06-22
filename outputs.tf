output "id" {
  value = try(aws_elasticache_replication_group.this[0].id, aws_elasticache_cluster.this[0].id)
}

output "name" {
  value = try(aws_elasticache_replication_group.this[0].id, aws_elasticache_cluster.this[0].id)
}

output "primary_endpoint" {
  value = try(aws_elasticache_replication_group.this[0].primary_endpoint_address, aws_elasticache_cluster.this[0].cache_nodes[0].address)
}
