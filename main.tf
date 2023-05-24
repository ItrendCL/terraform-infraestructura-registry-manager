resource "aws_ecr_repository" "repository" {
  name                 = "${var.repository}/lambdas/${var.app_name}/${var.fn_name}"
  force_delete         = true
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags

  provisioner "local-exec" {
    command = <<EOF
      docker login ${data.aws_ecr_authorization_token.token.proxy_endpoint} -u AWS -p ${data.aws_ecr_authorization_token.token.password}
      docker pull alpine
      docker tag alpine ${aws_ecr_repository.repository.repository_url}:${var.image_tag}
      docker push ${aws_ecr_repository.repository.repository_url}:${var.image_tag}
      EOF
  }
}
