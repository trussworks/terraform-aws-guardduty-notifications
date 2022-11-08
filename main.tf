#
# GuardDuty
#

resource "aws_guardduty_detector" "main" {
  count = var.create_detector ? 1 : 0

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
  count = var.slack_notifications ? 1 : 0

  rule      = aws_cloudwatch_event_rule.main.name
  target_id = "send-to-sns-slack"
  arn       = var.sns_topic_slack_arn

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
  count = var.pagerduty_notifications ? 1 : 0

  rule      = aws_cloudwatch_event_rule.main.name
  target_id = "send-to-sns-pagerduty"
  arn       = var.sns_topic_pagerduty_arn
}
