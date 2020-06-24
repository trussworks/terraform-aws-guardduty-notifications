resource "aws_sns_topic" "slack" {
  name = var.sns_topic_name_slack
}

module "guardduty-notifications" {
  source = "../../"

  create_detector = true

  pagerduty_notifications = false

  sns_topic_slack = aws_sns_topic.slack
}
