return {
  -- LSP setup
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svlangserver = {
          cmd = { "svlangserver" },
          filetypes = { "systemverilog", "verilog" },
          root_dir = require("lspconfig.util").root_pattern(".git", "."),
        },
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "verilog",
      },
    },
  },

  -- Formatting + linting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        verilog = { "verible" },
        systemverilog = { "verible" },
      },
      formatters = {
        verible = {
          command = "verible-verilog-format",
        },
      },
    },
  },
}
