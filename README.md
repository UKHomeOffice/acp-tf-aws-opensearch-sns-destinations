# acp-tf-aws-opensearch-sns-destinations
The purpose of this Terraform module is to create sns topics and email subscriptions to be used as a destination \
when specifying internal opensearch alerting and actions.  

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.opensearch_sns_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_sns_topic.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_iam_policy_document.inline_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trust_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_map"></a> [destination\_map](#input\_destination\_map) | A map of lists detailing team and email addresses required for each internal monitoring destination for opensearch | `map` | `{}` | no |

## Example

As mentioned above, this module takes a map of lists as an input consisting of the team the resource is owned by and which emails will receive sns notifications. This allows multiple email addresses to subscribe to each teams sns topic. 
```
module "opensearch-destinations" {
  source = "git::https://github.com/UKHomeOffice/acp-tf-aws-opensearch-sns-destinations?ref=v1"
  destination_map = {
      "team1" = ["team1@email.com"]
      "team2" = ["team2@email.com"]
      "team3" = ["team3@email.com","team3second@email.com"]
  }
}
```