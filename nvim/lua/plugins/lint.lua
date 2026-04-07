return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      verilog = { "verible" },
      systemverilog = { "verible" },
    },
    linters = {
      verible = {
        cmd = "verible-verilog-lint",
        stdin = false,
        args = { "--parse_fatal", "--lint_fatal", "--ruleset=all" },
        stream = "stderr",

        ignore_exitcode = true,

        parser = require("lint.parser").from_pattern(
          [[([^:]+):(%d+):(%d+): ([^[]+) %[(.+)%]]],
          { "file", "lnum", "col", "message", "code" },
          {
            severity = vim.diagnostic.severity.WARN,
          }
        ),
      },
    },
  },
}
