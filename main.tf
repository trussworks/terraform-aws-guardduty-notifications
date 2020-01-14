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
 * module "guardduty-notifications" {
 *   source  = "trussworks/guardduty-notifications/aws"
 *   version = "1.0.2"
 *
 *   sns_topic_name_slack = "slack-event"
 *   sns_topic_name_pagerduty = "pagerduty-infra-alerts"
 * }
 * ```
 */

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
  event_pattern = file("${path.module}/event-pattern.json")
}

# More details about the response syntax can be found here:
# https://docs.aws.amazon.com/guardduty/latest/ug/get-findings.html#get-findings-response-syntax
resource "aws_cloudwatch_event_target" "slack" {
  rule      = aws_cloudwatch_event_rule.main.name
  target_id = "send-to-sns-slack"
  arn       = var.sns_topic_name_slack.arn

  input_transformer {
    input_paths = {
      title       = "$.detail.title"
      description = "$.detail.description"
      eventTime   = "$.detail.service.eventFirstSeen"
      region      = "$.detail.region"
    }

    input_template = "\"GuardDuty finding in <region> first seen at <eventTime>: <title> <description>\""
  }
}

resource "aws_cloudwatch_event_target" "pagerduty" {
  rule      = aws_cloudwatch_event_rule.main.name
  target_id = "send-to-sns-pagerduty"
  arn       = var.sns_topic_name_pagerduty.arn
}

