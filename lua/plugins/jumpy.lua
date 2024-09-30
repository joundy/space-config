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

		-- Keymaps
		local keymap = vim.keymap.set

		keymap("n", "f", "<Cmd>HopWord<CR>", { noremap = true, silent = true })
	end,
}
