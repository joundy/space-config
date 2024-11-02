return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	branch = "main",
	commit = "8e8f2c15ab005b07de7a207c42bd6b0de52c2f1d",
	lazy = false,
	build = "make",
	config = function()
		require("avante").setup()
	end,
}
