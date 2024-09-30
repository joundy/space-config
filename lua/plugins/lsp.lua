return {
  "neovim/nvim-lspconfig",
  tag = "v1.0.0",
  lazy = false,
  priority = 1000,
  config = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
      "ts_ls",
    }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
      })
    end

    -- If you need specific settings for a particular server,
    -- you can do so outside the loop:
    -- lspconfig.tsserver.setup({
    --   -- Specific settings for tsserver
    -- })

    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "<space>lr", vim.lsp.buf.rename, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)

    keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)

    local builtinTelescope = require("telescope.builtin")

    keymap("n", "<Leader>lR", builtinTelescope.lsp_references, opts)
    keymap("n", "<leader>lD", builtinTelescope.diagnostics, opts)
  end,
}
