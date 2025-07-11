return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  opts = {
    ensure_installed = {
      "clangd",
      'cmake-language-server',

      "codelldb",
      "clang-format",

      "lua-language-server",
      "luacheck",
      "stylua",

      "rust-analyzer",

      "bash-language-server",
      "shellcheck",
      "shfmt",
    },
  },

  config = function(_, opts)
    local mason = require("mason")
    mason.setup()

    local mason_tool_installer = require("mason-tool-installer")
    mason_tool_installer.setup {
      ensure_installed = opts.ensure_installed,
      auto_update = false, -- Set to true to auto-update tools on startup
      run_on_start = true, -- Automatically install tools on startup if not installed
    }
  end,
}
