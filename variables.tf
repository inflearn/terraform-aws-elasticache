variable "name" {
  type = string
}

variable "parameter_group_name" {
  type = string
}

variable "subnet_group_name" {
  type    = string
  default = null
}

variable "subnets" {
  type    = list(string)
  default = []
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "nodes" {
  description = "The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcached, this value must be between 1 and 40. If this number is reduced on subsequent runs, the highest numbered nodes will be removed. (Non cluster mode only)"
  type        = number
  default     = null
}

variable "node_groups" {
  description = "Number of node groups (shards) for this Redis replication group."
  type        = number
  default     = null
}

variable "replicas" {
  description = "Number of replica nodes in each node group."
  type        = number
  default     = null
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "port" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "automatic_failover_enabled" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
