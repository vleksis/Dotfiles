return {
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		---@module "conform"
		---@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
				go = { "goimports", "golines", "gofmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				lua = { "stylua" },
				cmake = { "cmake_format" },
			},
		},
	},
}
