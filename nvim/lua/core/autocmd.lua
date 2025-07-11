vim.api.nvim_create_augroup("ColorSchemeOverrides", { clear = true })

vim.api.nvim_create_autocmd("ColorScheme", {
  group = "ColorSchemeOverrides",
  pattern = "*",
  callback = function()
    vim.cmd [[highlight! NormalFloat guibg=none]]
    vim.cmd [[highlight! FloatBorder guibg=none]]
    vim.cmd [[highlight! FloatTitle guibg=none]]
    vim.cmd [[highlight! TelescopeNormal guibg=none]]
    vim.cmd [[highlight! TelescopeBorder guibg=none]]
    vim.cmd [[highlight! TelescopePromptBorder guibg=none]]
    vim.cmd [[highlight! TelescopePromptTitle guibg=none]]
  end,
})
