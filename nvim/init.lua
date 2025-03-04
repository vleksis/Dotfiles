-- Basic
require 'core.init_lazy'
require 'core.options'
require 'core.keybindings'
require 'core.autocmd'

-- Set up plugins
require('lazy').setup {
  spec = {
    { import = 'plugins.util' },
    { import = 'plugins.editor' },
    { import = 'plugins.ui' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.lsp' },
    { import = 'plugins.colorscheme' },
    { import = 'plugins.coding' },
    { import = 'plugins.misc' },
  },
}

require 'core.colorcheme'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
