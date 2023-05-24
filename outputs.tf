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
  value = local.image_tag
}