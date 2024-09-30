return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
		config = function(_, opts)
			require("Comment").setup(vim.tbl_extend("force", opts, {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}))
		end,
		keys = {
			{
				"<Leader>/",
				function()
					require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
				end,
				desc = "Toggle comment linewise",
				mode = { "n" },
			},
			{
				"<Leader>/",
				"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
				desc = "Toggle comment for selection",
				mode = { "v" },
			},
			{
				"<Leader>?",
				function()
					require("Comment.api").toggle.blockwise.count(vim.v.count > 0 and vim.v.count or 1)
				end,
				desc = "Toggle comment blockwise",
				mode = { "n" },
			},
			{
				"<Leader>?",
				"<esc><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<cr>",
				desc = "Toggle comment for selection blockwise",
				mode = { "v" },
			},
		},
	},
}
