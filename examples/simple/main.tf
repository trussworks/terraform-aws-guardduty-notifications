resource "aws_sns_topic" "slack" {
  name = var.sns_topic_name_slack
}

resource "aws_sns_topic" "pagerduty" {
  name = var.sns_topic_name_pagerduty
}


module "guardduty-notifications" {
  source = "../../"

  create_detector = true

  sns_topic_slack     = aws_sns_topic.slack
  sns_topic_pagerduty = aws_sns_topic.pagerduty
}
