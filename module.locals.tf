/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

locals {
  server_type_by_memory = "${
    var.server_memory <= 512 ? 0 : (
      var.server_memory <= 1024 ? 1 : (
        var.server_memory <= 2048 ? 2 : (
          var.server_memory <= 4096 ? 3 : (
            var.server_memory <= 6144 ? 4 : (
              var.server_memory <= 8192 ? 5 : (
                var.server_memory <= 16384 ? 6 : (
                  var.server_memory <= 32768 ? 7 : (
                    var.server_memory <= 65536 ? 8 : (
                      var.server_memory <= 98304 ? 9 : -1
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  }"
  server_type_by_processors = "${
    var.server_processors <= 1 ? 0 : (
      var.server_processors <= 2 ? 3 : (
        var.server_processors <= 3 ? 4 : (
          var.server_processors <= 4 ? 5 : (
            var.server_processors <= 6 ? 6 : (
              var.server_processors <= 8 ? 7 : (
                var.server_processors <= 10 ? 8 : (
                  var.server_processors <= 12 ? 9 : -1
                )
              )
            )
          )
        )
      )
    )
  }"
  server_type = "${
    local.server_type_by_memory > -1 && local.server_type_by_processors > -1 ?
    element(local.server_types, max(local.server_type_by_memory, local.server_type_by_processors)) :
    ""
  }"
  server_types = [
    "ac949a1cb4731d",
    "89833c1dfa7010",
    "0469d586374e76",
    "e991abd8ef15c7",
    "489b7df86d4b76",
    "9559dbb4b71c45",
    "ebf313a9994c1e",
    "86fa7f6209ba2a",
    "25848db6009838",
    "115f1d99e8e9e4",
  ]
}
