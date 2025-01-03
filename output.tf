output "lambda_function_url" {
  value = one(aws_lambda_function_url.this[*].function_url)
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}
