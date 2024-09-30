return {
	{
		"lewis6991/gitsigns.nvim",
		tag = "v0.9.0",
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
	{
		"tpope/vim-fugitive",
		branch = "master",
		commit = "d4877e54cef67f5af4f950935b1ade19ed6b7370",
		lazy = false,
		opts = {},
		config = function()
			local keymap = vim.keymap.set
			local opts = { noremap = true, silent = true }

			keymap("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
			keymap("n", "<leader>gf", ":Git<CR>", opts)
		end,
	},
}
