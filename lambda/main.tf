# Lambda function
resource "aws_lambda_function" "example" {
  filename         = "hello_world.zip" # NOTE: Zip file with your code
  function_name    = "my_lambda_function"
  role             = var.role #aws_iam_role.example.arn
  handler          = "hello_world.lambda_handler"  #NOTE : <filename without py extension>.<function name>
  source_code_hash = filebase64sha256("hello_world.zip") #data.archive_file.example.output_base64sha256

  runtime = "python3.12"

  vpc_config {
    subnet_ids         = var.prvsubnet #aws_subnet.private.id
    security_group_ids = var.lambda_sec_gp #[aws_security_group.lambda.id]
  }

#   environment {
#     variables = {
#       ENVIRONMENT = "production"
#       LOG_LEVEL   = "info"
#     }
#   }

  tags = {
    #Environment = "production"
    Application = "example"
  }
}