output "server_type" {
  description = "The package id"
  value       = "${local.server_type}${substr(element(concat(null_resource.trigger_error.*.id, list("")), 0), 0, 0)}"
}
