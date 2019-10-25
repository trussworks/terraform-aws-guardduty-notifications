variable "sns_topic_name_slack" {
  type        = "string"
  description = "The name of the Slack SNS topic to send AWS GuardDuty findings."
}

variable "sns_topic_name_pagerduty" {
  type        = "string"
  description = "The name of the PagerDuty SNS topic to send AWS GuardDuty findings."
}
