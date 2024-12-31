module "simple_lambda" {
  source = "../../module"

  name = "simple-lambda-using-uv"
  description = "Simple lambda function with using uv"

  using_uv = true
}
