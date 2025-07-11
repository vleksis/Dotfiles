return {
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerRun", "OverseerToggle", "OverseerQuickAction" },
		keys = {
			{ "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Task" },
			{ "<leader>oo", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },
			{ "<leader>oq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
		},

		opts = {
			task_list = {
				direction = "left", -- or "left", "right", "top"
				min_width = 0.2,
				default_detail = 1,
			},
			strategy = {
				"jobstart",
			},
			auto_clear = true,
			notify_on_completion = true,
			templates = { "builtin", "cmake" },
		},
	},
}
