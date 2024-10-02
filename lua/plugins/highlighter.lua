return {
	"nvim-treesitter/nvim-treesitter",
	version = "v0.9.2",
	lazy = true,
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		auto_install = true,
		highlight = {
			enable = true,
			disable = function(_, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			additional_vim_regex_highlighting = false,
		},
		ensure_installed = { "markdown", "markdown_inline" },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
