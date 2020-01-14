resource "aws_sns_topic" "slack" {
  name = var.sns_topic_name_slack
}

resource "aws_sns_topic" "pagerduty" {
  name = var.sns_topic_name_pagerduty
}


module "guardduty-notifications" {
  source = "../../"

  sns_topic_name_slack     = aws_sns_topic.slack
  sns_topic_name_pagerduty = aws_sns_topic.pagerduty
}