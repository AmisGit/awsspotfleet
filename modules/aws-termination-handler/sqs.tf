resource "aws_sqs_queue" "aws_termination_handler_queue" {
  name                      = "AWSTerminationHandlerQueue"
  message_retention_seconds = 300
}


resource "aws_sqs_queue_policy" "aws_termination_handler_queue" {
  queue_url = aws_sqs_queue.aws_termination_handler_queue.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "AWSTerminationHandlerQueuePolicy",
    "Statement": [{
        "Effect": "Allow",
        "Principal": {
            "Service": ["events.amazonaws.com", "sqs.amazonaws.com"]
        },
        "Action": "sqs:SendMessage",
        "Resource": "${aws_sqs_queue.aws_termination_handler_queue.arn}"
    }]
}
POLICY
}