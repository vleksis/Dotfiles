-- Basic
require("core.init_lazy")
require("core.options")
require("core.keybindings")
require("core.autocmd")
require("core.lsp")

-- Set up plugins
require("lazy").setup({
	spec = {
		{ import = "plugins.util" },
		{ import = "plugins.editor" },
		{ import = "plugins.ui" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.colorscheme" },
		{ import = "plugins.coding" },
		{ import = "plugins.misc" },
		{ import = "plugins.langs" },
		{ import = "overseer" },
	},
})

require("core.colorcheme")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
