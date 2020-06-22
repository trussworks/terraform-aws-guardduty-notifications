variable "create_detector" {
  description = "Create GuardDuty detector"
  type        = bool
  default     = false
}

variable "pagerduty_notifications" {
  description = "Enable PagerDuty notifications for GuardDuty findings"
  type        = bool
  default     = true
}

variable "slack_notifications" {
  description = "Enable Slack notifications for GuardDuty findings"
  type        = bool
  default     = true
}

variable "sns_topic_slack" {
  description = "Slack SNS Topic Object."
  type        = object({ arn = string, name = string })
}

variable "sns_topic_pagerduty" {
  description = "PagerDuty SNS Topic Object."
  type        = object({ arn = string, name = string })
}
