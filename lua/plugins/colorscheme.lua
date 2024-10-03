-- return {
-- 	"joundy/neovim-ayu",
-- 	name = "ayu",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd("colorscheme ayu")
-- 	end,
-- }

return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "night", -- Choose the style you prefer
			transparent = false, -- Set this to false to ensure the background is not transparent
			styles = {
				-- Style to be applied to different syntax groups
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark",
				floats = "dark",
			},
			sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows
			day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style
			hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead
			dim_inactive = false, -- dims inactive windows
			lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			on_colors = function(colors)
				colors.bg_float = "#000000"
				colors.bg = "#000000"

				colors.bg_highlight = "#000000"
				colors.bg_sidebar = "#000000"
			end,
		})

		vim.cmd("colorscheme tokyonight-night")
	end,
}
