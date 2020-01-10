module "notify_slack" {
  source  = "terraform-aws-modules/notify-slack/aws"
  version = "~> 2.0"

  sns_topic_name = "slack-topic"

  slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
  slack_channel     = "aws-notification"
  slack_username    = "reporter"
}

module "guardduty-notifications" {
  source = "../../"

  sns_topic_name_slack     = var.sns_topic_name_slack
  sns_topic_name_pagerduty = var.sns_topic_name_pagerduty
}