return {
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	branch = "master",
	-- 	commit = "1a237cf50372830a61d92b0adf00d3b23882e0e1",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- },
	-- {
	--   "Exafunction/codeium.nvim",
	--   branch = "main",
	--   commit = "dddaee0d1e9a1d0bcaea66f08a8103b3cdf26604",
	--   lazy = false,
	--   config = function()
	--     require("codeium").setup({
	--       -- Optionally disable cmp source if using virtual text only
	--       -- enable_cmp_source = true,
	--       virtual_text = {
	--         enabled = true,
	--
	--         -- These are the defaults
	--
	--         -- Set to true if you never want completions to be shown automatically.
	--         manual = false,
	--         -- A mapping of filetype to true or false, to enable virtual text.
	--         filetypes = {},
	--         -- Whether to enable virtual text of not for filetypes not specifically listed above.
	--         default_filetype_enabled = true,
	--         -- How long to wait (in ms) before requesting completions after typing stops.
	--         idle_delay = 75,
	--         -- Priority of the virtual text. This usually ensures that the completions appear on top of
	--         -- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
	--         -- desired.
	--         virtual_text_priority = 65535,
	--         -- Set to false to disable all key bindings for managing completions.
	--         map_keys = true,
	--         -- The key to press when hitting the accept keybinding but no completion is showing.
	--         -- Defaults to \t normally or <c-n> when a popup is showing.
	--         accept_fallback = nil,
	--         -- Key bindings for managing completions in virtual text mode.
	--         key_bindings = {
	--           -- Accept the current completion.
	--           accept = "<C-f><C-f>",
	--           -- Accept the next word.
	--           accept_word = false,
	--           -- Accept the next line.
	--           accept_line = false,
	--           -- Clear the virtual text.
	--           clear = false,
	--           -- Cycle to the next completion.
	--           next = "<C-f><C-n>",
	--           -- Cycle to the previous completion.
	--           prev = "<C-f><C-N>",
	--         },
	--       },
	--     })
	--   end,
	-- },
	{
		"supermaven-inc/supermaven-nvim",
		branch = "main",
		commit = "07d20fce48a5629686aefb0a7cd4b25e33947d50",
		lazy = false,
		config = function()
			require("supermaven-nvim").setup({
				-- TODO: use better keymaps
				keymaps = {
					accept_suggestion = "<C-f>",
					clear_suggestion = "<C-a>",
					accept_word = "<C-w>",
				},
				-- ignore_filetypes = { cpp = true }, -- or { "cpp", }
				-- color = {
				--   suggestion_color = "#ffffff",
				--   cterm = 244,
				-- },
				-- log_level = "info",            -- set to "off" to disable logging completely
				-- disable_inline_completion = false, -- disables inline completion for use with cmp
				-- disable_keymaps = false,       -- disables built in keymaps for more manual control
				-- condition = function()
				--   return false
				-- end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
			})
		end,
	},
	{
		dependencies = {
			"folke/snacks.nvim",
			branch = "main",
			commit = "bc0630e43be5699bb94dadc302c0d21615421d93",
		},
		"coder/claudecode.nvim",
		branch = "main",
		commit = "985b4b117ea13ec85c92830ecac8f63543dd5ead",
		lazy = false,
		config = true,
		opts = {
			terminal_cmd = "~/.claude/local/claude", -- Point to local installation
			-- THESE just a dummy terminal provider to prevent claude terminal from opening
			-- i prefer to use the claude terminal outside of nvim
			terminal = {
				provider = {
					-- Required functions
					setup = function(config)
						-- Initialize your terminal provider
					end,

					open = function(cmd_string, env_table, effective_config, focus)
						-- Open terminal with command and environment
						-- focus parameter controls whether to focus terminal (defaults to true)
					end,

					close = function()
						-- Close the terminal
					end,

					simple_toggle = function(cmd_string, env_table, effective_config)
						-- Simple show/hide toggle
					end,

					focus_toggle = function(cmd_string, env_table, effective_config)
						-- Smart toggle: focus terminal if not focused, hide if focused
					end,

					get_active_bufnr = function()
						-- Return terminal buffer number or nil
						return 0 -- example
					end,

					is_available = function()
						-- Return true if provider can be used
						return true
					end,

					-- Optional functions (auto-generated if not provided)
					toggle = function(cmd_string, env_table, effective_config)
						-- Defaults to calling simple_toggle for backward compatibility
					end,

					_get_terminal_for_test = function()
						-- For testing only, defaults to return nil
						return nil
					end,
				},
			},
		},
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
			},
			-- Diff management
			{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
}
