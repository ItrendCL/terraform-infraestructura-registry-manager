locals {
  image_tag = var.image_tag
}

resource "aws_ecr_repository" "repository" {
  # count = local.create_ecr ? 1 : 0
  name                 = "${var.repository}-lambda-${var.fn_name}"
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
      docker tag alpine ${aws_ecr_repository.repository.repository_url}:${local.image_tag}
      docker push ${aws_ecr_repository.repository.repository_url}:${local.image_tag}
      EOF
  }
}
