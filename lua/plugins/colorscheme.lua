return {
  "joundy/neovim-ayu",
  name = "ayu",
  lazy = false,
  priority = 5000,
  config = function()
    vim.cmd("colorscheme ayu") -- Replace this with your favorite colorscheme
  end,
}
