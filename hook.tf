resource "null_resource" "before_build_hook" {
  triggers = {
    trigger = var.before_build_hook_trigger
  }

  provisioner "local-exec" {
    working_dir = "${path.cwd}/${var.docker_context}"
    command = var.before_build_hook_command
  }
}
