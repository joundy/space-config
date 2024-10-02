return {
	{
		"nvim-tree/nvim-web-devicons",
		branch = "master",
		commit = "1e5a2a796a88b5d696acb07dd5c285b13d13da21",
	},
	{
		"nvim-lualine/lualine.nvim",
		branch = "master",
		commit = "b431d228b7bbcdaea818bdc3e25b8cdbe861f056",
	},
	{
		"nvim-lua/plenary.nvim",
		version = "v0.1.4",
	},
	{
		"stevearc/dressing.nvim",
		version = "v3.0.0",
	},
	{
		"MunifTanjim/nui.nvim",
		version = "0.3.0",
	},
	{
		"HakonHarnes/img-clip.nvim",
		version = "v0.5.0",
		lazy = true,
		event = "VeryLazy",
		opts = {
			default = {
				embed_image_as_base64 = false,
				prompt_for_file_name = false,
				drag_and_drop = {
					insert_mode = true,
				},
				use_absolute_path = true,
			},
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		version = "v7.2.0",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
}
