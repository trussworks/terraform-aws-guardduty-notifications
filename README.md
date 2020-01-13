Enable AWS GuardDuty and configures any findings to be sent to and SNS topic.

Creates the following resources:

* GuardDuty detector to enable GuardDuty
* CloudWatch event rule to filter GuardDuty Findings
* CloudWatch event target to send to SNS topic formatted as `GuardDuty finding: <title>`

## Terraform Versions

Terraform 0.12. Pin module version to ~> 2.0. Submit pull-requests to master branch.

Terraform 0.11. Pin module version to ~> 1.0. Submit pull-requests to terraform011 branch.

## Usage

```hcl
module "guardduty-notifications" {
  source  = "trussworks/guardduty-notifications/aws"
  version = "1.0.2"

  sns_topic_name_slack = "slack-event"
  sns_topic_name_pagerduty = "pagerduty-infra-alerts"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| sns\_topic\_name\_pagerduty | PagerDuty SNS Topic Object. | object | n/a | yes |
| sns\_topic\_name\_slack | Slack SNS Topic Object. | object | n/a | yes |

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

