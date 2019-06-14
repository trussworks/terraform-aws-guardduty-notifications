<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Enable AWS GuardDuty and configures any findings to be sent to and SNS topic.

Creates the following resources:

* GuardDuty detector to enable GuardDuty
* CloudWatch event rule to filter GuardDuty Findings
* CloudWatch event target to send to SNS topic formatted as `GuardDuty finding: <title>`

## Usage

```hcl
module "guardduty_notifications" {
  source = "../../modules/aws-guardduty-notifications"

  sns_topic_name = "slack-event"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| sns\_topic\_name | The name of the SNS topic to send AWS GuardDuty findings. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

