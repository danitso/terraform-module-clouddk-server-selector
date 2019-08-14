/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

resource "null_resource" "trigger_error" {
  count = "${local.server_type == "" ? 1 : 0}"

  provisioner "local-exec" {
    command = "echo ${format("Failed to find a server type matching the specified hardware requirements (memory: %d MB - processors: %d)", var.server_memory, var.server_processors)} && exit 1"
  }
}
