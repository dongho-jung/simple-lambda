# WHAT?
A terraform module for simple Lambda deployment

# WHEN?
- When you want to use a runtime not supported by the Serverless Framework (e.g. Python 3.11↑)
- When you don't have time to troubleshoot Serverless Framework issues and documentation
- When you need to deploy a simple Lambda without the CloudFormation headache
- When you're tired of setting up ECR, CloudWatch, Docker Image, and other resources manually with Terraform

# HOW?
TBD

# WHY?
1. **No additional installations or updates required**
2. **Straightforward Deployment Process:**
    - Preview plan with `terraform plan`
    - Deploy with `terraform apply`
    - No confusion over deployment options
3. **AWS SSO Support:** Use AWS SSO locally without extra setup. Unlike the Serverless Framework, this module has built-in AWS SSO support
4. **Efficient Package Management with Docker Layers:** Automatically leverages Docker Layer caching without additional plugins or configurations (e.g. no need for `serverless-python-requirements` or slim/strip settings)
5. **Automatic File Change Detection:** Detects changes in the caller working directory and builds/deploys only when necessary
6. **Easy Scheduler Integration:** Add Lambda schedulers effortlessly with `schedule_cron` (e.g. `schedule_cron` = `0 0 * * ? *`)
7. **Transparent Resource Changes:** Terraform's plan output makes it easy to understand why resources are created, modified, or deleted, unlike CloudFormation
8. **Tag Management Made Simple:** Leverages Terraform AWS Provider's default tag functionality, removing the need for plugins like `serverless-plugin-resource-tagging`
9. **Comprehensive Resource Definitions:** Defines ECR Repository, CloudWatch Event, CloudWatch Logs LogGroup, Docker Image, and other resources when deploying Lambda

# EXAMPLES
## 1. Minimum Configuration
```terraform
module "simple_lambda" {
    source = "git::https://github.com/dongho-jung/simple-lambda"
    
    name = "my-lambda"
    description = "my lambda"
    runtime = "python3.12"
    
    role_name = "my-lambda-role"
    docker_context = "src"
    
    schedule_cron = "0 0 * * ? *"  # KST 09:00 daily
}
```
