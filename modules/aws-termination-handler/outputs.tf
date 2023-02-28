output "aws_iam_openid_connect_provider_eks_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}

output "aws_sqs_queue_aws_termination_handler_queue_arn" {
  value = aws_sqs_queue.aws_termination_handler_queue.arn
}