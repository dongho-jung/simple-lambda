resource "null_resource" "before_build_hook" {
  triggers = {
    trigger = filesha256("./src/uv.lock")
  }

  provisioner "local-exec" {
    working_dir = "${path.cwd}/${var.path_to_dockerfile_dir}"
    command = "uv export > requirements.txt"
  }
}