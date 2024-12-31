module "simple_lambda" {
  source = "../../module"

  name = "simple-lambda-cron"
  description = "Simple lambda function with cron"

  event_source_crons = ["35 0 ? * * *"]
}
