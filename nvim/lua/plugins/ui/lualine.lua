return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
				-- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = true,
			update_in_insert = false,
			always_visible = true,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = "[+]", modified = "[m]", removed = "[-]" }, -- changes diff symbols
			cond = hide_in_width,
		}

		local navic = require("nvim-navic")
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto", -- Set theme based on environment variable
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "neo-tree" },
				always_divide_middle = true,
			},

			sections = {
				lualine_a = { mode },
				lualine_b = { "branch" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = {
					diagnostics,
					diff,
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},

			tabline = {},

			winbar = {
				lualine_a = { filename },
				lualine_c = {
					{
						function()
							local location = navic.get_location()
							if location == "" then
								location = " "
							end
							return location
						end,
						cond = function()
							return true
						end,
					},
				},
			},

			inactive_winbar = {
				lualine_a = { filename },
			},

			extensions = { "fugitive" },
		})
	end,
}
