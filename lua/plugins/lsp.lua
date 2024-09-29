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
    keymap("n", "<Leader>lR", vim.lsp.buf.references, opts)
    keymap("n", "<space>lr", vim.lsp.buf.rename, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
  end,
}
