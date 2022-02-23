resource "aws_sns_topic" "email" {
  for_each = var.destination_map
  name     = "${each.key}-opensearch-destination"
}

resource "aws_sns_topic_subscription" "email" {
  for_each  = {
    for email_address in local.subscriptionList : "${email_address.team}.${email_address.email}" => email_address
  }
  topic_arn = aws_sns_topic.email[each.value.team].arn
  endpoint  = each.value.email
  protocol  = "email"
}

resource "aws_iam_role" "opensearch_sns_role" {
  for_each            = var.destination_map
  name                = "${each.key}-opensearch-destination-role"
  assume_role_policy  = data.aws_iam_policy_document.trust_policy.json
  inline_policy {
    name   = "${each.key}-sns"
    policy = data.aws_iam_policy_document.inline_policy[each.key].json
  }  
}
