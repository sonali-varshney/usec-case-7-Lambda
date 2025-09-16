output "lambda_invoke_arn"{
value = aws_lambda_function.example.invoke_arn
}

output "function_name"{
value = aws_lambda_function.example.function_name
}
