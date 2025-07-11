return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{
				"<leader>tv",
				function()
					require("toggleterm").toggle(nil, nil, nil, "vertical")
				end,
				desc = "Open vertical terminal",
			},
			{
				"<leader>th",
				"<cmd>ToggleTerm direction=horizontal<CR>",
				desc = "Open horizontal terminal",
			},

			{
				"<C-CR>",
				"<cmd>ToggleTerm direction=float<CR>",
				desc = "Open float terminal",
			},
			{
				"<C-CR>",
				function()
					for _, term in ipairs(require("toggleterm.terminal").get_all()) do
						if term:is_open() then
							term:close()
						end
					end
				end,
				desc = "Close all terminals",
				mode = { "t" },
			},
		},

		opts = {
			size = function(term)
				if term.direction == "vertical" then
					return vim.o.columns * 0.4
				else
					return 20
				end
			end,

			direction = "float",
			autochdir = true,
			float_opts = {
				border = "curved",
				width = 10000,
				height = 10000,
			},
		},
	},
}
