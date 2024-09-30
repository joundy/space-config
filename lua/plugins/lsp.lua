return {
	"neovim/nvim-lspconfig",
	version = "v0.1.7",
	lazy = false,
	priority = 2000,
	keys = {
		{ "gd",         vim.lsp.buf.definition,                     desc = "Go to definition",       mode = "n" },
		{ "gD",         vim.lsp.buf.declaration,                    desc = "Go to declaration",      mode = "n" },
		{ "<space>lr",  vim.lsp.buf.rename,                         desc = "Rename symbol",          mode = "n" },
		{ "K",          vim.lsp.buf.hover,                          desc = "Show hover information", mode = "n" },
		{ "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Open diagnostic float",  mode = "n" },
		{
			"<Leader>lR",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "List references",
			mode = "n",
		},
		{
			"<leader>lD",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "List diagnostics",
			mode = "n",
		},
	},
}
