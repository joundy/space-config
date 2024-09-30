local mason_lsp_ensure_installed = {
	"typescript-language-server",
	"eslint-lsp",
	"gopls",
	"golangci-lint-langserver",
}

local mason_null_ls_ensure_installed = {
	"stylua",
	"prettier",
	"golangci_lint",
}

return {
	{
		"williamboman/mason.nvim",
		tag = "v1.10.0",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		tag = "v1.31.0",
		priority = 1500,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(client, bufnr)
				null_ls.on_attach(client, bufnr)
			end

			mason_lspconfig.setup({
				ensure_installed = mason_lsp_ensure_installed,
				automatic_installation = true,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,

				-- Customization
				-- lua_ls = function()
				-- 	lspconfig.lua_ls.setup({
				-- 		on_attach = on_attach,
				-- 		settings = {
				-- 			Lua = {
				-- 				diagnostics = {
				-- 					globals = { "vim" },
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		tag = "v2.6.0",
		priority = 1500,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local mason_null_ls = require("mason-null-ls")
			-- local null_ls = require("null-ls")

			mason_null_ls.setup({
				ensure_installed = mason_null_ls_ensure_installed,
				automatic_installation = true,

				handlers = {
					function(source_name, methods)
						require("mason-null-ls.automatic_setup")(source_name, methods)
					end,

					-- Customization
					-- prettier = function(source_name, methods)
					-- 	null_ls.register(null_ls.builtins.formatting.prettier.with({
					-- 		extra_args = {
					-- 			"--print-width",
					-- 			"100",
					-- 			"--tab-width",
					-- 			"2",
					-- 			"--use-tabs",
					-- 			"false",
					-- 			"--semi",
					-- 			"true",
					-- 			"--single-quote",
					-- 			"false",
					-- 			"--trailing-comma",
					-- 			"es5",
					-- 			"--bracket-spacing",
					-- 			"true",
					-- 			"--arrow-parens",
					-- 			"always",
					-- 		},
					-- 		filetypes = {
					-- 			"javascript",
					-- 			"javascriptreact",
					-- 			"typescript",
					-- 			"typescriptreact",
					-- 			"vue",
					-- 			"css",
					-- 			"scss",
					-- 			"less",
					-- 			"html",
					-- 			"json",
					-- 			"yaml",
					-- 			"markdown",
					-- 			"graphql",
					-- 		},
					-- 	}))
					-- end,
				},
			})
			require("null-ls").setup()
		end,
	},
}
