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
    "clouddk.s1",
    "clouddk.s2",
    "clouddk.s3",
    "clouddk.s4",
    "clouddk.s5",
    "clouddk.s6",
    "clouddk.s7",
    "clouddk.s8",
    "clouddk.s9",
    "clouddk.s10",
  ]
}
