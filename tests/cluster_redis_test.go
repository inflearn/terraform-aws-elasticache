package main

import (
	"github.com/gruntwork-io/terratest/modules/test-structure"
	"testing"
)

func TestElastiCacheClusterRedis(t *testing.T) {
	t.Parallel()

	elasticacheTfDir := "../examples/cluster-redis"

	defer test_structure.RunTestStage(t, "teardown", func() { teardown(t, elasticacheTfDir) })
	test_structure.RunTestStage(t, "deploy", func() { deploy(t, elasticacheTfDir, map[string]interface{}{}) })
}
