return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    -- opts = {
    --   size = 20,                  -- Default size for horizontal and float
    --   open_mapping = "<leader>t", -- Open terminal
    --   direction = "float",
    -- },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",                                  desc = "Open float terminal" },
      { "<leader>tv", function() require("toggleterm").toggle(nil, nil, nil, "vertical") end, desc = "Open vertical terminal" },
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>",                             desc = "Open horizontal terminal" },
      {
        "<leader>tq",
        function()
          for _, term in ipairs(require("toggleterm.terminal").get_all()) do
            if term:is_open() then
              term:close()
            end
          end
        end,
        desc = "Close all terminals",
        mode = { 't' }
      },
    },
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "vertical" then
            return vim.o.columns * 0.4 -- 40% of the editor's width
          else
            return 20                  -- Default for horizontal and float
          end
        end,
        -- open_mapping = "<leader>t", -- Open terminal
        direction = "float",
      })
    end,
  }
}

