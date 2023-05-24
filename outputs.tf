# Re-export inputs
output "repository" {
  value = var.repository
}

output "ecr_repository" {
  value = aws_ecr_repository.repository
}

output "fn_name" {
  value = var.fn_name
}

output "image_tag" {
  value = var.image_tag
}

output "image_uri" {
  value = "${aws_ecr_repository.repository.repository_url}:${var.image_tag}"
}