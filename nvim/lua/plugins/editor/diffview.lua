return {
  {
    'sindrets/diffview.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons', -- Plenary is required
    config = function()
      local dv = require('diffview')

      -- FIX: find a way to make it properly
      -- not vim.cmd('close')
      vim.keymap.set('n', '<leader>gd', function()
        local views = require('diffview.lib').views
        if next(views) == nil then
          dv.open()
          vim.cmd('close')
        else
          dv.close()
        end
      end, { desc = 'Toggle Diffview with All Changed Files' })


      vim.keymap.set('n', '<leader>gD', function()
        local views = require('diffview.lib').views
        if next(views) == nil then
          dv.open()
        else
          dv.close()
        end
      end, { desc = 'Toggle Diffview with All Changed Files' })

      require 'diffview'.setup {
      }
    end
  },
}
