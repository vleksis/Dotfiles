local tool_name = "cmake"

-- helper to detect any CMake project (even in subdirs)
local is_cmake_project = function(cwd)
	return #vim.fs.find("CMakeLists.txt", { path = cwd, upward = true, type = "file" }) > 0
end

--------------------------------------------------------------------------------
-- Section: Configure & Build
--------------------------------------------------------------------------------

return {
	name = "CMake: Build",
	builder = function()
		return {
			name = "CMake: Build",
			cmd = tool_name,
			args = { "--build", "build" },
			components = { "default" },
		}
	end,
	condition = {
		callback = function(opts)
			return is_cmake_project(opts.dir) and vim.fn.executable(tool_name) == 1
		end,
	},
	priority = 90,
}
