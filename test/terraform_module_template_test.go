package test

// ---------------------------------------------------------------------------------------------------------------------
// BASIC TERRATEST
// ---------------------------------------------------------------------------------------------------------------------

// func TestTerraform<INSERT_NAME_OF_MODULE>(t *testing.T) {
// 	t.Parallel()
//
// 	awsRegion := aws.GetRandomStableRegion(t, nil, nil)
//
// 	terraformOptions := &terraform.Options{
// 		TerraformDir: "../examples/simple/",
// 		Vars:         map[string]interface{}{},
// 		EnvVars:      map[string]string{
// 			"AWS_DEFAULT_REGION": awsRegion,
// 		},
// 	}
//
// 	defer terraform.Destroy(t, terraformOptions)
// 	terraform.InitAndApply(t, terraformOptions)
//
// }
