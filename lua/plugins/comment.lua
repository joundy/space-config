return {
	dependencies = {
		{
			"JoosepAlviste/nvim-ts-context-commentstring",
			branch = "main",
			commit = "44fd461b879d80a21d5041f312f070f22551c0bc",
			lazy = true,
			config = function()
				require("ts_context_commentstring").setup({
					enable_autocmd = false,
				})
			end,
		},
	},
	"numToStr/Comment.nvim",
	branch = "master",
	commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local comment = require("Comment")

		comment.setup({
			pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
		})

		-- Keymaps
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		keymap("n", "<Leader>/", function()
			require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
		end, opts)
		keymap("v", "<Leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)

		keymap("n", "<Leader>?", function()
			require("Comment.api").toggle.blockwise.count(vim.v.count > 0 and vim.v.count or 1)
		end, opts)
		keymap("v", "<Leader>?", "<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>", opts)
	end,
}
