return {
  'numToStr/Comment.nvim',
  config = function()
    require("Comment").setup({
      mappings = {
        -- Disable default mappings that conflict with your custom ones
        basic = true,  -- Disable basic mappings like `gcc`
        extra = false,  -- Disable extra mappings
        extended = false,  -- Disable extended mappings
      },
      toggler = {
        line  = "<leader>ll",
        block = "<leader>lb",
      },
      opleader = {
        line  = "<leader>ll",
        block = "<leader>lb",
      },
    })
  end,
}
