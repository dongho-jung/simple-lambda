locals {
  before_build_hook_trigger = length(var.using) == 0 ? null : (
    contains(var.using, "uv") ? filesha256("${path.cwd}/${var.path_to_dockerfile_dir}/uv.lock") : null
  )

  before_build_hook_command = length(var.using) == 0 ? null : (
    contains(var.using, "uv") ? "uv export > requirements.txt" : null
  )
}

resource "null_resource" "before_build_hook" {
  triggers = {
    trigger = local.before_build_hook_trigger
  }

  provisioner "local-exec" {
    working_dir = "${path.cwd}/${var.path_to_dockerfile_dir}"
    command = local.before_build_hook_command
  }
}
