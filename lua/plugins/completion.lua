local function has_words_before()
	local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		"hrsh7th/cmp-nvim-lsp",
		branch = "main",
		commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d",
		lazy = true,
		event = "InsertEnter",
		priority = 2000,
	},
	{
		"saadparwaiz1/cmp_luasnip",
		branch = "master",
		commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
		lazy = true,
		event = "InsertEnter",
	},
	{
		"rafamadriz/friendly-snippets",
		branch = "main",
		commit = "00ba9dd3df89509f95437b8d595553707c46d5ea",
		lazy = true,
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.3.0",
		lazy = true,
		event = "InsertEnter",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		branch = "main",
		commit = "ae644feb7b67bf1ce4260c231d1d4300b19c6f30",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = {
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.config.disable,
					["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		version = "v0.3.1",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		branch = "main",
		commit = "e239a560f338be31337e7abc3ee42515daf23f5e",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = true, -- Auto close on trailing </
				},

				-- per_filetype = {
				--   ["html"] = {
				--     enable_close = false
				--   }
				-- }
			})
		end,
	},
}
