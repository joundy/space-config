return {
	"romgrk/barbar.nvim",
	version = "v1.9.1",
	lazy = true,
	event = "VimEnter",
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	keys = {
		{ "<C-h>",      "<Cmd>BufferPrevious<CR>",     desc = "Previous buffer",   mode = "n" },
		{ "<C-l>",      "<Cmd>BufferNext<CR>",         desc = "Next buffer",       mode = "n" },
		{ "<C-j>",      "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer left",  mode = "n" },
		{ "<C-k>",      "<Cmd>BufferMoveNext<CR>",     desc = "Move buffer right", mode = "n" },
		{ "<C-p>",      "<Cmd>BufferPin<CR>",          desc = "Pin buffer",        mode = "n" },
		{ "<Leader>bc", "<Cmd>BufferClose<CR>",        desc = "Close buffer",      mode = "n" },
		{
			"<Leader>bC",
			"<Cmd>BufferCloseAllButCurrentOrPinned<CR>",
			desc = "Close all buffers but current or pinned",
			mode = "n",
		},
	},
	config = function(_, opts)
		require("barbar").setup(opts)
		vim.g.barbar_auto_setup = false
	end,
}
