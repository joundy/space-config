return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	lazy = false,
	priority = 2000,
	config = function()
		local builtin = require("telescope.builtin")

		-- Keymaps
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap("n", "<leader>fa", function()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
			})
		end, opts)
		keymap("n", "<leader>ff", builtin.find_files, opts)
		keymap("n", "<leader>fw", builtin.live_grep, opts)
		keymap("n", "<leader>fb", builtin.buffers, opts)
		keymap("n", "<leader>fh", builtin.help_tags, opts)
	end,
}
