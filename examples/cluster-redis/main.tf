terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75.1"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source         = "git::ssh://git@github.com/inflearn/terraform-aws-vpc.git?ref=v3.14.0"
  name           = "example-inflab-elasticache-cluster-redis"
  cidr           = "10.0.0.0/16"
  azs            = ["ap-northeast-2a"]
  public_subnets = ["10.0.0.0/24"]

  tags = {
    iac  = "terraform"
    temp = "true"
  }
}

module "security_group" {
  source              = "git::ssh://git@github.com/inflearn/terraform-aws-security-group.git?ref=v4.9.0"
  name                = "example-inflab-elasticache-cluster-redis"
  description         = "Security group terraform example elasticache"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["222.99.194.226/32"]
  ingress_rules       = ["redis-tcp"]
}

resource "aws_elasticache_parameter_group" "this" {
  family = "redis6.x"
  name   = "example-inflab-elasticache-cluster-redis"
}

module "elasticache" {
  source               = "../../"
  name                 = "example-inflab-elasticache-cluster-redis"
  subnets              = module.vpc.public_subnets
  security_groups      = [module.security_group.security_group_id]
  engine               = "redis"
  engine_version       = "6.x"
  port                 = 6379
  instance_type        = "cache.t3.micro"
  parameter_group_name = aws_elasticache_parameter_group.this.name
  node_groups          = 2
  replicas             = 2

  tags = {
    iac  = "terraform"
    temp = "true"
  }
}
