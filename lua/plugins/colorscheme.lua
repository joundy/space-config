return {
	"joundy/neovim-ayu",
	name = "ayu",
	lazy = false,
	priority = 10000,
	config = function()
		vim.cmd("colorscheme ayu")
	end,
}
