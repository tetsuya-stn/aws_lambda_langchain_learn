resource "aws_dynamodb_table" "langchain_session" {
  name         = "LangChainSessionTable"
  hash_key     = "SessionId"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "SessionId"
    type = "S"
  }
}