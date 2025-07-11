local tool_name = "cmake"

-- Helper to detect any CMake project (even in subdirs)
local is_cmake_project = function(cwd)
	return #vim.fs.find("CMakeLists.txt", { path = cwd, upward = true, type = "file" }) > 0
end

return {
	name = "CMake: Configure & Build",
	builder = function()
		return {
			name = "CMake: Configure & Build",
			strategy = {
				"orchestrator",
				tasks = {
					"CMake: Configure(Debug)",
					"CMake: Build",
				},
			},
			components = { "default" },
		}
	end,
	condition = {
		callback = function(opts)
			return is_cmake_project(opts.dir) and vim.fn.executable(tool_name) == 1
		end,
	},
}
