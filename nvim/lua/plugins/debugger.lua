
return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap",
    -- config = function(_, _)
    --   require("core.utils").load_mappings("dap")
    -- end
  }
}
--
-- return {
--   'mfussenegger/nvim-dap',
--   dependencies = {
--     'jay-babu/mason-nvim-dap.nvim',
--     'rcarriga/nvim-dap-ui',
--     'theHamsta/nvim-dap-virtual-text',
--     { 'nvim-neotest/nvim-nio' }, -- Add this dependency
--   },
--   config = function()
--     local dap = require('dap')
--     local dapui = require('dapui')
--
--     dapui.setup()
--     require('nvim-dap-virtual-text').setup()
--
--     -- dap.adapters.cppdbg = {
--     --   type = 'executable',
--     --   command = '/path/to/cpptools/debugAdapter',
--     -- }
--     dap.configurations.cpp = {
--       {
--         name = "Launch file",
--         type = "cppdbg",
--         request = "launch",
--         program = function()
--           return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--         end,
--         cwd = '${workspaceFolder}',
--         stopAtEntry = true,
--       },
--     }
--
--   end,
-- }

