/**
 * Enable AWS GuardDuty and configures any findings to be sent to and SNS topic.
 *
 * Creates the following resources:
 *
 * * GuardDuty detector to enable GuardDuty
 * * CloudWatch event rule to filter GuardDuty Findings
 * * CloudWatch event target to send to SNS topic formatted as `GuardDuty finding: <title>`
 *
 * ## Usage
 *
 * ```hcl
 * module "guardduty_notifications" {
 *   source = "../../modules/aws-guardduty-notifications"
 *
 *   sns_topic_name = "slack-event"
 * }
 * ```
 */

#
# SNS
#

data "aws_sns_topic" "main" {
  name = "${var.sns_topic_name}"
}

#
# GuardDuty
#

resource "aws_guardduty_detector" "main" {
  enable = true
}

#
# CloudWatch Event
#

resource "aws_cloudwatch_event_rule" "main" {
  name          = "guardduty-finding-events"
  description   = "AWS GuardDuty event findings"
  event_pattern = "${file("${path.module}/event-pattern.json")}"
}

resource "aws_cloudwatch_event_target" "main" {
  rule      = "${aws_cloudwatch_event_rule.main.name}"
  target_id = "send-to-sns"
  arn       = "${data.aws_sns_topic.main.arn}"

  input_transformer = {
    input_paths {
      title = "$.detail.title"
    }

    input_template = "\"GuardDuty finding: <title>\""
  }
}
