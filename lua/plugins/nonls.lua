return {
	"nvimtools/none-ls.nvim",
	branch = "main",
	commit = "68a39ec218a9f15ebb2bb36c8c245681d5e61144",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	priority = 2000,
	config = function()
		-- Keymaps
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap("n", "<leader>lf", vim.lsp.buf.format, opts)
	end,
}
