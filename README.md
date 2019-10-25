<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Enable AWS GuardDuty and configures any findings to be sent to and SNS topic.

Creates the following resources:

* GuardDuty detector to enable GuardDuty
* CloudWatch event rule to filter GuardDuty Findings
* CloudWatch event target to send to SNS topic formatted as `GuardDuty finding: <title>`

## Usage

```hcl
module "guardduty-notifications" {
  source  = "trussworks/guardduty-notifications/aws"
  version = "1.0.2"

  sns_topic_name_slack = "slack-event"
  sns_topic_name_pagerduty = "pagerduty-infra-alerts"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| sns\_topic\_name\_pagerduty | The name of the PagerDuty SNS topic to send AWS GuardDuty findings. | string | n/a | yes |
| sns\_topic\_name\_slack | The name of the Slack SNS topic to send AWS GuardDuty findings. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
