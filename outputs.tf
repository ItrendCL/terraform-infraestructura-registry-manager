# Re-export inputs
output "repository" {
  value = var.repository
}

output "ecr_repository" {
  value = aws_ecr_repository.repository
}