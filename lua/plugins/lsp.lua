return {
	"neovim/nvim-lspconfig",
	version = "v0.1.7",
	lazy = false,
	priority = 2000,
	config = function()
		-- Keymaps
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap("n", "gd", vim.lsp.buf.definition, opts)
		keymap("n", "gD", vim.lsp.buf.declaration, opts)
		keymap("n", "<space>lr", vim.lsp.buf.rename, opts)
		keymap("n", "K", vim.lsp.buf.hover, opts)

		keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

		local builtinTelescope = require("telescope.builtin")

		keymap("n", "<Leader>lR", builtinTelescope.lsp_references, opts)
		keymap("n", "<leader>lD", builtinTelescope.diagnostics, opts)
	end,
}
