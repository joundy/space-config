return {
	"nvim-tree/nvim-tree.lua",
	tag = "v1.7.0",
	lazy = true,
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	keys = {
		{ "<Leader>ee", "<Cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
		{ "<Leader>er", "<Cmd>NvimTreeRefresh<CR>", desc = "Refresh NvimTree" },
		{ "<Leader>ef", "<Cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
		{ "<Leader>e/", "<Cmd>NvimTreeFindFile<CR>", desc = "Find file in NvimTree" },
	},
	opts = {
		filters = {
			dotfiles = false,
		},
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = false,
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_root = false,
		},
		view = {
			adaptive_size = false,
			float = {
				enable = true,
				open_win_config = {
					width = 45,
					height = 50,
				},
			},
		},
		git = {
			enable = true,
			ignore = false,
		},
	},
	config = function(_, opts)
		-- Recommended settings to disable default netrw file explorer
		-- vim.g.loaded_netrw = 1
		-- vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup(opts)
	end,
}
