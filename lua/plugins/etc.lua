return {
	{
		"windwp/nvim-autopairs",
		branch = "master",
		commit = "f158dcb865c36f72c92358f87787dab2c272eaf3",
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},
	{
		"axelvc/template-string.nvim",
		branch = "main",
		commit = "419bfb2e4d5f0e6ddd0d4435f85b69da0d88d524",
		lazy = false,
		opts = {},
		config = function(_, opts)
			require("template-string").setup(opts)
		end,
	},
	{
		"preservim/tagbar",
		branch = "master",
		commit = "d55d454bd3d5b027ebf0e8c75b8f88e4eddad8d8",
		lazy = false,
	},
}
