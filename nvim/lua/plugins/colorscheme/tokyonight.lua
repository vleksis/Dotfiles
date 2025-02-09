return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    vim.g.tokyonight_style = "moon"
    vim.g.tokyonight_transparent = true         -- Enable transparent background
    vim.g.tokyonight_italic_comments = true     -- Italicize comments
    vim.g.tokyonight_italic_keywords = false    -- Italicize keywords
    vim.g.tokyonight_italic_functions = false   -- Italicize functions
    vim.g.tokyonight_italic_variables = false   -- Italicize variables
    vim.g.tokyonight_transparent_sidebar = false -- Transparent sidebar

    -- Load the colorscheme
    vim.cmd [[colorscheme tokyonight]]
  end,
}
