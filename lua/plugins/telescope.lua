return {
	"nvim-telescope/telescope.nvim",
	version = "0.1.8",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-telescope/telescope-media-files.nvim",
		branch = "master",
		commit = "0826c7a730bc4d36068f7c85cf4c5b3fd9fb570a",
	},
	keys = {
		{ "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", desc = "Find all files" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
		{ "<leader>fm", "<cmd>Telescope media_files<cr>", desc = "Media files" },
	},
	priority = 2000,
	config = function()
	  local telescope = require("telescope")
		telescope.setup({
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
		})
		telescope.load_extension("media_files")
	end,
}
