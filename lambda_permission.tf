resource "aws_lambda_permission" "crons" {
  count = length(var.event_source_crons)

  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.crons[count.index].arn
}

resource "aws_lambda_permission" "alarms" {
  count = length(var.event_source_cloudwatch_alarm_names) > 0 ? 1 : 0

  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal = "events.amazonaws.com"
  source_arn = one(aws_cloudwatch_event_rule.alarms[*].arn)
}