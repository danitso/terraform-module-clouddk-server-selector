/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

output "server_type" {
  description = "The package id"
  value       = "${local.server_type}${substr(element(concat(null_resource.trigger_error.*.id, list("")), 0), 0, 0)}"
}
