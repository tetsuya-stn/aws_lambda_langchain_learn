resource "aws_iam_role" "sfn_langchain" {
  name = "sfn_langchain_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "states.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "sfn_langchain" {
  name = "sfn_langchain_policy"
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Effect" = "Allow",
        "Action" = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource" = "*"
      },
      {
        "Effect" = "Allow",
        "Action" = [
          "lambda:InvokeFunction"
        ],
        "Resource" = [
          aws_lambda_function.langchain.arn,
          aws_lambda_function.notify_slack.arn,
        ]
      }
    ]
  })
}