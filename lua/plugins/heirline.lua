return {
	"rebelot/heirline.nvim",
	tag = "v1.0.6",
	lazy = true,
	event = "VimEnter",
	priority = 5000,
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		-- Define colors
		local colors = {
			bg = "#282c34",
			fg = "#abb2bf",
			yellow = "#e5c07b",
			cyan = "#56b6c2",
			darkblue = "#081633",
			green = "#98c379",
			orange = "#d19a66",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#61afef",
			red = "#e86671",
		}

		local LSPActive = {
			condition = function()
				return next(vim.lsp.buf_get_clients()) ~= nil
			end,
			update = { "LspAttach", "LspDetach" },

			provider = function()
				local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
				local buf_client_names = {}

				-- Add client names to the table
				for _, client in pairs(buf_clients) do
					if client.name ~= "null-ls" then
						table.insert(buf_client_names, client.name)
					end
				end

				-- Add null-ls sources
				local null_ls_sources = {}
				for _, source in ipairs(require("null-ls.sources").get_available(vim.bo.filetype)) do
					table.insert(null_ls_sources, source.name)
				end

				if #null_ls_sources > 0 then
					table.insert(buf_client_names, "null-ls(" .. table.concat(null_ls_sources, ", ") .. ")")
				end

				return " [" .. table.concat(buf_client_names, " ") .. "]"
			end,
			hl = { fg = colors.green, bold = true },
		}

		local FileType = {
			provider = function()
				return string.upper(vim.bo.filetype)
			end,
			hl = { fg = colors.blue, bold = true },
		}

		local GitBranch = {
			condition = conditions.is_git_repo,

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,

			hl = { fg = colors.orange },

			{
				provider = function(self)
					return " " .. self.status_dict.head
				end,
				hl = { bold = true },
			},
			{
				condition = function(self)
					return self.has_changes
				end,
				provider = " ●",
				hl = { fg = colors.green },
			},
		}

		local Diagnostics = {
			condition = conditions.has_diagnostics,

			static = {
				error_icon = "E",
				warn_icon = "W",
				info_icon = "I",
				hint_icon = "H",
			},

			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,

			update = { "DiagnosticChanged", "BufEnter" },

			{
				provider = function(self)
					-- Show only non-zero diagnostics
					local parts = {}
					if self.errors > 0 then
						table.insert(parts, string.format("%s:%d", self.error_icon, self.errors))
					end
					if self.warnings > 0 then
						table.insert(parts, string.format("%s:%d", self.warn_icon, self.warnings))
					end
					if self.info > 0 then
						table.insert(parts, string.format("%s:%d", self.info_icon, self.info))
					end
					if self.hints > 0 then
						table.insert(parts, string.format("%s:%d", self.hint_icon, self.hints))
					end
					return table.concat(parts, " ")
				end,
				hl = { fg = colors.red },
			},
		}

		-- Assemble statusline
		local StatusLine = {
			GitBranch,
			{ provider = " | " },
			FileType,
			{ provider = " | " },
			LSPActive,
			{ provider = " | " },
			Diagnostics,
		}

		-- Setup heirline
		heirline.setup({
			statusline = StatusLine,
		})
	end,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
