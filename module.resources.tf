resource "null_resource" "trigger_error" {
  count = "${local.server_type == "" ? 1 : 0}"

  provisioner "local-exec" {
    command = "echo ${format("Failed to find a server type matching the specified hardware requirements (memory: %d MB - processors: %d)", var.server_memory, var.server_processors)} && exit 1"
  }
}
