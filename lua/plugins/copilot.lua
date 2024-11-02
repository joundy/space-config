return {
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	branch = "master",
	-- 	commit = "1a237cf50372830a61d92b0adf00d3b23882e0e1",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- },
	{
		"Exafunction/codeium.nvim",
		branch = "main",
		commit = "dddaee0d1e9a1d0bcaea66f08a8103b3cdf26604",
		lazy = false,
		config = function()
			require("codeium").setup({})
		end,
	},
}
