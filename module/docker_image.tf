locals {
  current_time = formatdate("YYMMDD_HHmmss", timestamp())
}


resource "docker_image" "this" {
  name = var.name

  build {
    context = abspath(var.path_to_dockerfile_dir)
    tag = [
      "${aws_ecr_repository.this.repository_url}:latest",
      "${aws_ecr_repository.this.repository_url}:${local.current_time}"
    ]
    platform = var.target_arch
  }

  keep_locally = true
}

resource "null_resource" "docker_push" {
  depends_on = [
    docker_image.this
  ]

  provisioner "local-exec" {
    command = <<-EOT
      docker push ${aws_ecr_repository.this.repository_url}:latest
      docker push ${aws_ecr_repository.this.repository_url}:${local.current_time}
    EOT
  }
}
