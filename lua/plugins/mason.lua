return {
  {
    "williamboman/mason.nvim",
    tag = "v1.10.0",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    tag = "v1.31.0",
    lazy = false,
    opts = {
      ensure_installed = {
        "ts_ls",
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end,
  },
}
