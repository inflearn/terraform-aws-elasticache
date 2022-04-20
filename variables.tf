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
  description = "Number of cache nodes to provision (Non cluster mode only)"
  type        = number
  default     = null
}

variable "node_groups" {
  description = "Number of cache node groups to provision (Cluster mode only)"
  type        = number
  default     = null
}

variable "replicas" {
  description = "Number of replicas to provision (Cluster mode only)"
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
