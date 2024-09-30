return {
	"nvimtools/none-ls.nvim",
	branch = "main",
	commit = "68a39ec218a9f15ebb2bb36c8c245681d5e61144",
	lazy = false,
	priority = 2000,
	keys = {
		{ "<leader>lf", vim.lsp.buf.format, desc = "Format buffer", mode = "n" },
	},
}
