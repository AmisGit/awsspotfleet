resource "aws_cloudwatch_event_rule" "ASGTermRule" {
  name        = "ASGTermRule"
  description = "EC2 Instance-terminate Lifecycle Action"

  event_pattern = <<EOF
{
  "source": [
    "aws.autoscaling"
  ],
  "detail-type": [
    "EC2 Instance-terminate Lifecycle Action"
  ]
}
EOF
}


resource "aws_cloudwatch_event_target" "ASGTermRuleSQS" {
  rule      = aws_cloudwatch_event_rule.ASGTermRule.name
  target_id = "1"
  arn       = aws_sqs_queue.aws_termination_handler_queue.arn
}


resource "aws_cloudwatch_event_rule" "ScheduledChangeRule" {
  name        = "ScheduledChangeRule"
  description = "AWS Health Event"

  event_pattern = <<EOF
{
  "source": [
    "aws.health"
  ],
  "detail-type": [
    "AWS Health Event"
  ]
}
EOF
}


resource "aws_cloudwatch_event_target" "ScheduledChangeRuleSQS" {
  rule      = aws_cloudwatch_event_rule.ScheduledChangeRule.name
  target_id = "1"
  arn       = aws_sqs_queue.aws_termination_handler_queue.arn
}


resource "aws_cloudwatch_event_rule" "SpotTermRule" {
  name        = "SpotTermRule"
  description = "EC2 Spot Instance Interruption Warning"

  event_pattern = <<EOF
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Spot Instance Interruption Warning"
  ]
}
EOF
}


resource "aws_cloudwatch_event_target" "SpotTermRuleSQS" {
  rule      = aws_cloudwatch_event_rule.SpotTermRule.name
  target_id = "1"
  arn       = aws_sqs_queue.aws_termination_handler_queue.arn
}


resource "aws_cloudwatch_event_rule" "InstanceStateChangeRule" {
  name        = "InstanceStateChangeRule"
  description = "EC2 Instance State-change Notification"

  event_pattern = <<EOF
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
}
EOF
}


resource "aws_cloudwatch_event_target" "InstanceStateChangeRuleSQS" {
  rule      = aws_cloudwatch_event_rule.InstanceStateChangeRule.name
  target_id = "1"
  arn       = aws_sqs_queue.aws_termination_handler_queue.arn
}