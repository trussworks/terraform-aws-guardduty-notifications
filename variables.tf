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

variable "sns_topic_slack_arn" {
  description = "Slack SNS Topic ARN"
  type        = string
  default     = ""
}

variable "sns_topic_pagerduty_arn" {
  description = "PagerDuty SNS Topic ARN"
  type        = string
  default     = ""
}
