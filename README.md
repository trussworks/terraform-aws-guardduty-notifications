Enable AWS GuardDuty and configures any findings to be sent to and SNS topic.

Creates the following resources:

* CloudWatch event rule to filter GuardDuty Findings
* CloudWatch event target to send to SNS topic formatted as `GuardDuty finding: <title>`

Optionally, it can also create the GuardDuty detector as well.


## Usage

```hcl
module "guardduty-notifications" {
  source  = "trussworks/guardduty-notifications/aws"
  version = "5.0.0"

  sns_topic_slack_arn     = aws_sns_topic.slack.arn
  sns_topic_pagerduty_arn = aws_sns_topic.pagerduty.arn
}
```


## Terraform Versions

Terraform 0.13 or later. Pin module version to ~> 5.0.0 Submit pull-requests to master branch.

Terraform 0.12. Pin module version to ~> 3.0.0 Submit pull-requests to master branch.

## Upgrade Notice v4.x.x to v5.x.x

* The `sns_topic_slack` and `sns_topic_pagerduty` variables have been
  renamed to `sns_topic_slack_arn` and `sns_topic_pagerduty_arn`; they
  are also taking ARNs as values, and not `aws_sns_topic` objects. We
  made this change to better handle the outputs of the `notify-slack`
  Terraform module, which outputs names and ARNs, but not objects.

## Upgrade Notice v2.x.x to v3.x.x

Version 3 makes a number of changes to the module that will break if it
is updated in place. Specifically:

* The GuardDuty detector is now an optional part of the module, and
  defaults to off; if you are leaving the GuardDuty detector in this
  module, you will need to add "create\_detector = true" as a parameter
  and do a `terraform state mv` of the detector like so:

  ```console
  terraform state mv module.module_name.aws_guardduty_detector.main module.module_name.aws_guardduty_detector.main[0]
  ```

* The `sns_topic_name_slack` and `sns_topic_name_pagerduty` variables
  have been renamed `sns_topic_slack` and `sns_topic_pagerduty` because
  they are not actually names, but the actual SNS topic objects.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_detector | Create GuardDuty detector | `bool` | `false` | no |
| pagerduty\_notifications | Enable PagerDuty notifications for GuardDuty findings | `bool` | `true` | no |
| slack\_notifications | Enable Slack notifications for GuardDuty findings | `bool` | `true` | no |
| sns\_topic\_pagerduty\_arn | PagerDuty SNS Topic ARN | `string` | `""` | no |
| sns\_topic\_slack\_arn | Slack SNS Topic ARN | `string` | `""` | no |

## Outputs

No output.

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
