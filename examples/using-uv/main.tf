module "simple_lambda" {
  source = "../../module"

  name = "simple-lambda-using-uv"
  description = "Simple lambda function for using uv"

  using = ["uv"]
}
