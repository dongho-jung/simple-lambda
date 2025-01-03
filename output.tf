output "lambda_function_url" {
  value = one(aws_lambda_function_url.this[*].function_url)
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}

output "image_tag" {
  value = docker_image.this.repo_digest
}

output "iam_role_arn" {
  value = one(aws_iam_role.this[*].arn)
}
