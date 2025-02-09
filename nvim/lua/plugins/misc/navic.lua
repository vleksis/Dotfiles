return {
  {
    "SmiteshP/nvim-navic",
    config = function ()
      local navic = require("nvim-navic")
      navic.setup({
        lsp = {
          auto_attach = true
        }
      })
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     if not vim.g.trouble_lualine then
  --       table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
  --     end
  --   end,
  -- }
}
