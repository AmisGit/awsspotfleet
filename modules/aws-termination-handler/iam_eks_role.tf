resource "aws_iam_openid_connect_provider" "eks" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"]
  url             = var.aws_iam_openid_connect_provider_url
}

module "iam_eks_role" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  role_name = "node-termination-handler"

  attach_node_termination_handler_policy = true

  oidc_providers = {
    main = {
      provider_arn               = aws_iam_openid_connect_provider.eks.arn
      namespace_service_accounts = var.aws_iam_openid_connect_provider_namespace_service_accounts
    }
  }
}