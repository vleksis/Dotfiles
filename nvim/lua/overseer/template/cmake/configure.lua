local tool_name = "cmake"

local is_cmake_project = function(cwd)
	return #vim.fs.find("CMakeLists.txt", { path = cwd, upward = true, type = "file" }) > 0
end

return {
	name = "CMake: Configure(Debug)",
	builder = function()
		return {
			name = "CMake: Configure(Debug)",
			cmd = tool_name,
			args = { "-S", ".", "-B", "build", "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON", "-DCMAKE_BUILD_TYPE=Debug" },
			components = { "default" },
		}
	end,
	condition = {
		callback = function(opts)
			return is_cmake_project(opts.dir) and vim.fn.executable(tool_name) == 1
		end,
	},
	priority = 100,
}
