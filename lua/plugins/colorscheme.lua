return {
	"joundy/neovim-ayu",
	name = "ayu",
	lazy = true,
	priority = 10000,
	config = function()
		vim.cmd("colorscheme ayu")
	end,
	event = "VimEnter",
}
