return {
	"romgrk/barbar.nvim",
	tag = "v1.9.1",
	lazy = true,
	event = "VimEnter",
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	config = function(_, opts)
		require("barbar").setup(opts)

		vim.g.barbar_auto_setup = false

		-- Keymaps
		local keymap = vim.keymap.set

		keymap("n", "<C-h>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
		keymap("n", "<C-l>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })
		keymap("n", "<C-j>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
		keymap("n", "<C-k>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true })
		keymap("n", "<C-p>", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })

		keymap("n", "<Leader>bc", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })
		keymap("n", "<Leader>bC", "<Cmd>BufferCloseAllButCurrentOrPinned<CR>", { noremap = true, silent = true })
	end,
}
