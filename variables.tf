variable "sns_topic_name_slack" {
  description = "Slack SNS Topic Object."
  type        = object({ arn = string, name = string })
}

variable "sns_topic_name_pagerduty" {
  description = "PagerDuty SNS Topic Object."
  type        = object({ arn = string, name = string })
}
