return {
	"phaazon/hop.nvim",
	tag = "v2.0.3",
	lazy = true,
	keys = {
		{ "f", "<Cmd>HopWord<CR>", mode = "n", desc = "Hop to word" },
	},
	opts = {},
	config = function(_, opts)
		require("hop").setup(opts)
	end,
}
