return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  branch = "main",
  commit = "0705234991d03170a72582085dc508600a03a779",
  lazy = false,
  build = "make",
  config = function()
    require("avante").setup()
  end,
}
