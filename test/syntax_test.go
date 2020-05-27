package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestSyntaxForIntegration(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../example",
	}
	terraform.RunTerraformCommandE(t, terraformOptions, terraform.FormatArgs(terraformOptions, "fmt", "--check")...)

}
