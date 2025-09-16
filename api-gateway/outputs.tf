# Display the Invoke URL of the API Gateway.
output "base_url" {
  value = aws_api_gateway_stage.mystage.invoke_url
}