return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim', -- Ensure mason itself is installed
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      local navic = require("nvim-navic")

      -- Ensure clangd is installed
      mason_lspconfig.setup({
        ensure_installed = { "clangd" },
      })

      mason_lspconfig.setup_handlers {
        -- Custom handler for clangd
        function(server_name)
          vim.keymap.set("n", "K", vim.lsp.buf.hover,
            { desc = "Show hover documentation", noremap = true, silent = true, buffer = bufnr })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            { desc = "Show code actions", noremap = true, silent = true, buffer = bufnr })
          vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,
            { desc = "Refactor name", noremap = true, silent = true, buffer = bufnr })
          -- Optionally, add formatting on save or other commands here

          -- Optionally, if blink provides extra LSP-related functions or UI feedback,
          -- ensure those are initialized here.
          if server_name == "clangd" then
            lspconfig.clangd.setup({
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--function-arg-placeholders",
                "--suggest-missing-includes"
              },
              filetypes = { "c", "cpp", "objc", "objcpp" },
              root_dir = lspconfig.util.root_pattern(".git"),
              settings = {
                clangd = {
                  crossFileRename = true,
                },
              },
              on_attach = function(client, bufnr)
                if client.server_capabilities.documentSymbolProvider then
                  navic.attach(client, bufnr)
                end
                -- Set up keymaps for common LSP functions
                local opts = { noremap = true, silent = true, buffer = bufnr }
              end,
            })
          else
            -- For all other LSP servers, use the default setup
            lspconfig[server_name].setup {}
          end
        end,
      }
    end,
  },
}
