resource "aws_sfn_state_machine" "langchain" {
  name       = "serverless_chatbot_langchain"
  role_arn   = aws_iam_role.sfn_langchain.arn
  definition = <<EOT
{
  "Comment": "Serverless chatbot using LangChain",
  "StartAt": "LangChain",
  "States": {
    "LangChain": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.langchain.arn}",
      "Next": "NotifySlack"
    },
    "NotifySlack": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.notify_slack.arn}",
      "End": true
    }
  }
}
EOT
}