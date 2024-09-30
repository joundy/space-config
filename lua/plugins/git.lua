return {
	{
		"lewis6991/gitsigns.nvim",
		version = "v0.9.0",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"tpope/vim-fugitive",
		branch = "master",
		commit = "d4877e54cef67f5af4f950935b1ade19ed6b7370",
		lazy = true,
		cmd = { "Git", "Gdiffsplit" },
		keys = {
			{ "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff split" },
			{ "<leader>gf", ":Git<CR>",        desc = "Open Git status" },
		},
		opts = {},
	},
}
