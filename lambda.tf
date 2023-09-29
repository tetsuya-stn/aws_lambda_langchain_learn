resource "aws_lambda_function" "langchain" {
  architectures                  = ["arm64"]
  function_name                  = "LangChain"
  image_uri                      = "" # lambda/langchainディレクトリでビルドしたイメージを指定
  package_type                   = "Image"
  reserved_concurrent_executions = 1
  role                           = ""
  timeout                        = 300
  environment {
    variables = {
      OPENAI_API_KEY  = ""
      SERPAPI_API_KEY = ""
    }
  }
  ephemeral_storage {
    size = 512
  }
  lifecycle {
    ignore_changes = [
      image_uri,
      environment,
    ]
  }
}

resource "aws_lambda_function" "notify_slack" {
  architectures                  = ["arm64"]
  function_name                  = "NotifySlack"
  image_uri                      = "" # # lambda/notify_slackディレクトリでビルドしたイメージを指定
  package_type                   = "Image"
  reserved_concurrent_executions = 1
  role                           = ""
  timeout                        = 300
  environment {
    variables = {
      SLACK_CHANNEL = ""
      WEBHOOK_URL   = ""
    }
  }
  ephemeral_storage {
    size = 512
  }
  lifecycle {
    ignore_changes = [
      image_uri,
      environment,
    ]
  }
}