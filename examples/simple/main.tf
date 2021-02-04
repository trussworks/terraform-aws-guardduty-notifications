resource "aws_sns_topic" "slack" {
  name = var.sns_topic_name_slack
}

resource "aws_sns_topic" "pagerduty" {
  name = var.sns_topic_name_pagerduty
}


module "guardduty-notifications" {
  source = "../../"

  create_detector = false

  sns_topic_slack_arn     = aws_sns_topic.slack.arn
  sns_topic_pagerduty_arn = aws_sns_topic.pagerduty.arn
}
