
data "aws_iam_policy_document" "trust_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = [
        "es.amazonaws.com",
        "opensearch.amazonaws.com"
        ]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "inline_policy" {
  for_each    = var.destination_map
  statement {
    actions   = ["sns:publish"]
    resources = [
      aws_sns_topic.email[each.key].arn,
    ]
  }
}