
# Get region and account ID
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

# Build and push the docker image
data "aws_ecr_authorization_token" "token" {}