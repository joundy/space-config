return {
	{
		"zbirenbaum/copilot.lua",
		branch = "master",
		commit = "1a237cf50372830a61d92b0adf00d3b23882e0e1",
		lazy = false,
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
}
