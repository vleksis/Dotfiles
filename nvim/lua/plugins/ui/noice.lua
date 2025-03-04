-- Helper function to calculate the popup position.
-- Here, we compute the row as the current line plus 2 rows, and set a fixed column.
local function get_shifted_position()
  return {
    row = vim.fn.line('.') + 2, -- position the popup 2 rows below the current cursor line
    -- col = "20",                 -- position at column 20; adjust as needed
  }
end

return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    opts = {
      lsp = {

        signature = {
          enabled = true,
          view = 'hover',

          opts = {
            border = {
              style = 'rounded',
              padding = { 1, 2 },
            },
            position = get_shifted_position(),
          },
        },
        hover = {
          enabled = true, -- Enable noice's hover handler
          view = "hover", -- (Optional) Specify a custom view (e.g. "hover", "popup")
          opts = {
            border = {
              style = "rounded",
              padding = { 1, 2 },
            },
            position = get_shifted_position()
          },
        },

        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },

      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
      redirect = {
        view = "popup"
      }
    },

    -- stylua: ignore
    keys = {
      -- { "<leader>n",  "",                                                                            desc = "+noice" },
      -- { "<S-Enter>",  function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                              desc = "Redirect Cmdline" },
      -- { "<leader>nl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
      -- { "<leader>nh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
      -- { "<leader>na", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
      -- { "<leader>nd", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
      -- { "<leader>nt", function() require("noice").cmd("pick") end,                                   desc = "Noice Picker (Telescope/FzfLua)" },
      -- { "<c-f>",      function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,                           expr = true,              desc = "Scroll Forward",  mode = { "i", "n", "s" } },
      -- { "<c-b>",      function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,                           expr = true,              desc = "Scroll Backward", mode = { "i", "n", "s" } },
    },

    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  }
}
