return {
	name = "Compile Current File (clang++)",
	builder = function()
		local src = vim.fn.expand("%")
		local out = vim.fn.expand("%:r")
		return {
			name = "clang++ " .. src,
			cmd = "clang++",
			args = { "-std=c++23", src, "-o", out },
			components = { "default" },
		}
	end,
	condition = {
		callback = function(opts)
			return vim.bo.filetype == "cpp" and vim.fn.executable("g++") == 1
		end,
	},
}
