-- File Explorer / Tree
return {
	"akinsho/toggleterm.nvim",
	tag = "v2.12.0",
	lazy = true,
	keys = {
		{
			"<Leader>tt",
			"<Cmd>ToggleTerm size=10 direction=horizontal<CR>",
			mode = { "n", "t" },
			desc = "Toggle horizontal terminal",
		},
		{
			"<Leader>tv",
			"<Cmd>lua SpawnTerminalRight()<CR>",
			mode = { "n", "t" },
			desc = "Spawn terminal to the right",
		},
		{ "jk", [[<C-\><C-n>]], mode = "t", desc = "Exit terminal mode" },
	},
	opts = {
		highlights = {
			-- Clear the background of the status line
			StatusLine = {
				guibg = "NONE",
			},
			-- Hide the text in the status line
			StatusLineNC = {
				guifg = "NONE",
				guibg = "NONE",
			},
		},
		-- Optionally, you can set the height of the status line to 0
		-- This will completely remove the space taken by the status line
		statusline = {
			enabled = false,
			-- or
			-- height = 0,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		function SpawnTerminalRight()
			local current_term = vim.b.toggle_number
			vim.cmd("wincmd l")
			if current_term then
				vim.cmd("ToggleTerm " .. (current_term + 1))
			else
				vim.cmd("ToggleTerm")
			end
		end
	end,
}
