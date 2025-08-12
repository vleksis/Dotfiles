return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
		{ "<leader>bd", "<Cmd>bprevious<CR><Cmd>bd#<CR>", desc = "Delete current buffer" },
		{ "<leader>bD", "<Cmd>bd<CR>", desc = "Delete current buffer with split" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
		{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
	},

	opts = {
		options = {
			mode = "buffers", -- set to "tabs" to only show tabpages instead
			themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			buffer_close_icon = "✗",
			close_icon = "✗",
			path_components = 1, -- Show only the file name without the directory
			modified_icon = "●",
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = false,
			diagnostics_update_in_insert = false,
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = { " ", " " },
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			show_tab_indicators = false,
			indicator = {
				-- icon = '▎', -- this should be omitted if indicator style is not 'icon'
				style = "none", -- Options: 'icon', 'underline', 'none'
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
			icon_pinned = "󰐃",
			minimum_padding = 1,
			maximum_padding = 5,
			maximum_length = 15,
			sort_by = "insert_at_end",
		},
		highlights = {
			separator = {
				fg = "#434C5E",
			},
			buffer_selected = {
				bold = true,
				italic = false,
			},
			-- separator_selected = {},
			-- tab_selected = {},
			-- background = {},
			-- indicator_selected = {},
			-- fill = {},
		},
	},
}
