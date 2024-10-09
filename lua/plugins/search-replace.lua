return {
	{

		"dyng/ctrlsf.vim",
		version = "v2.6.0",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.g.ctrlsf_ignore_dir = { ".gitignore", ".git", "node_modules", "target" }
		end,
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		commit = "a6975e7c1ee157615bbc80fc25e4392f71c344d4",
		event = { "BufReadPost", "BufNewFile" },
	},
}
