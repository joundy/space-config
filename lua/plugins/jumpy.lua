return {
  "phaazon/hop.nvim",
  tag = "v2.0.3",
  lazy = false,
  opts = {},
  config = function(_, opts)
    require("hop").setup(opts)

    -- Keymaps
    local keymap = vim.keymap.set

    keymap("n", "f", "<Cmd>HopWord<CR>", { noremap = true, silent = true })
  end,
}
