package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestIntegrationAsg(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../example",
	}

	region := "eu-west-1"

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	AsgName := terraform.Output(t, terraformOptions, "asg_name")

	aws.GetInstanceIdsForAsg(t, AsgName, region)

	Capacity := aws.GetCapacityInfoForAsg(t, AsgName, region)

	fmt.Printf("%+v\n", Capacity)
}
