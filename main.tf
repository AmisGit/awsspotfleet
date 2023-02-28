#
#   aws-termination-handler
#
module "awsyourname-aws-termination-handler" {
  source   = "./modules/aws-termination-handler"
  providers = {
    aws  = aws.aws-yourprovidername
   }
  aws_iam_openid_connect_provider_url = "https://oidc.eks.<region>.amazonaws.com/id/XXXXXXXXXXXX"
  aws_iam_openid_connect_provider_namespace_service_accounts = ["namespace_in_kuber_where_aws_termination_handler:name_of_service_account_aws_node_termination"]
}