local win_float = {
  type = 'float',
  realtive = 'editor',
  border = 'rounded'
}

local win_right = {
  type = 'split',
  relative = 'win',
  position = 'right',
  size = 0.4
}

local win_bottom = {
  type = 'split',
  relative = 'win',
  position = 'bottom',
  size = 0.2
}


TagAndGo = function(command)
  -- Validate the command argument
  if not command or command == "" then
    print("Please provide a valid LSP command for Trouble.")
    return
  end

  -- Mark the current location with the backtick (`)
  vim.cmd('normal! m`')

  -- Execute the provided command
  local success = vim.cmd(command)

  -- Check if the command was successful
  if success then
    -- Get the current cursor position
    local bufnr = vim.api.nvim_get_current_buf()
    local pos = vim.api.nvim_win_get_cursor(0)
    local item = {
      bufnr = bufnr,
      from = { bufnr, pos[1], pos[2] },
      tagname = vim.fn.expand("<cword>"),
    }

    -- Get the current tag stack
    local winid = vim.api.nvim_get_current_win()
    local stack = vim.fn.gettagstack(winid)
    stack.items = { item }

    -- Set the updated tag stack
    vim.fn.settagstack(winid, stack, 't')
  else
    print("Command failed: " .. command)
  end
end

return {
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    opts = {
      -- open_no_results = true, --Maybe delete
      modes = {
        symbols = {
          focus = true,
          win = win_right
        },
        lsp_base = {
          focus = true,
          win = win_right,
        },
        lsp = {
          focus = true,
          win = win_right,
        },
        diagnostics = {
          focus = true,
          win = win_bottom
        }
      },
    },

    keys = {
      { "<leader>dl", "<cmd>Trouble diagnostics toggle<cr>",                          desc = "Diagnostics List" },
      { "<leader>dL", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",             desc = "Buffer Diagnostics List" },
      { "<leader>cs", "<cmd>Trouble symbols toggle<cr>",                              desc = "Symbols" },
      { "<leader>cS", "<cmd>Trouble lsp toggle<cr>",                                  desc = "LSP references/definitions/..." },
      { "gd",         "<cmd>lua TagAndGo('Trouble lsp_definitions toggle')<CR>",      desc = "Go to Definitions" },
      { "gD",         "<cmd>lua TagAndGo('Trouble lsp_declarations toggle')<CR>",     desc = "Go to Declarations" },
      { "gi",         "<cmd>lua TagAndGo('Trouble lsp_implementations toggle')<CR>",  desc = "Go to Implementations" },
      { "gt",         "<cmd>lua TagAndGo('Trouble lsp_type_definitions toggle')<CR>", desc = "Go to Type Definition" },
      { "gr",         "<cmd>lua TagAndGo('Trouble lsp_references toggle')<CR>",       desc = "Find References" },
      {
        "[q",
        function()
          if require("trouble").is_open() then
            require("trouble").prev({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Previous Trouble/Quickfix Item",
      },
      {
        "]q",
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = "Next Trouble/Quickfix Item",
      },
    },
  }
}
