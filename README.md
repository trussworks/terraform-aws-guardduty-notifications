Enable AWS GuardDuty and configures any findings to be sent to and SNS topic.

Creates the following resources:

* GuardDuty detector to enable GuardDuty
* CloudWatch event rule to filter GuardDuty Findings
* CloudWatch event target to send to SNS topic formatted as `GuardDuty finding: <title>`

## Usage
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| sns\_topic |  | object | n/a | yes |
| sns\_topic\_name\_pagerduty | The name of the PagerDuty SNS topic to send AWS GuardDuty findings. | string | n/a | yes |
| sns\_topic\_name\_slack | The name of the Slack SNS topic to send AWS GuardDuty findings. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
pre-commit install --install-hooks
```

### Testing

[Terratest](https://github.com/gruntwork-io/terratest) is being used for
automated testing with this module. Tests in the `test` folder can be run
locally by running the following command:

```text
make test
```

Or with aws-vault:

```text
AWS_VAULT_KEYCHAIN_NAME=<NAME> aws-vault exec <PROFILE> -- make test
```

