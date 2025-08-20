return {
	"neovim/nvim-lspconfig",
	version = "v1.0.0",
	lazy = false,
	priority = 2000,
	keys = {
		{ "gd", vim.lsp.buf.definition, desc = "Go to definition", mode = "n" },
		{ "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
		{ "<space>lr", vim.lsp.buf.rename, desc = "Rename symbol", mode = "n" },
		{ "K", vim.lsp.buf.hover, desc = "Show hover information", mode = "n" },
		{
			"<leader>ld",
			function()
				local opts = {
					border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- You can customize the border symbols
					win_opts = { -- Additional winuow options can be set here
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				}
				vim.diagnostic.open_float(nil, opts)
			end,
			desc = "Open diagnostic float",
			mode = "n",
		},
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
				require("telescope.builtin").diagnostics({ bufnr = 0 })
			end,
			desc = "List diagnostics",
			mode = "n",
		},
		{
			"<leader>lDa",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "List diagnostics",
			mode = "n",
		},
	},
}
