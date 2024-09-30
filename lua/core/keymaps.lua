-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set

keymap("n", "<C-s>", "<cmd>w!<cr>", { noremap = true })
keymap("n", "<Leader>q", ":q<CR>", { noremap = true })
keymap("n", "<Leader>Q", "<cmd>confirm qall<cr>", { noremap = true })

-- Resizing windows
local function map_resize(mode, key, resize_cmd)
  local cmd = string.format("<cmd>%s<CR>", resize_cmd)
  if mode == "i" then
    cmd = "<Esc>" .. cmd .. "a"
  elseif mode == "v" then
    cmd = "<Esc>" .. cmd .. "gv"
  end
  vim.keymap.set(mode, key, cmd, { noremap = true, silent = true })
end

local resize_cmds = {
  ["<C-Up>"] = "resize +2",
  ["<C-Down>"] = "resize -2",
  ["<C-Left>"] = "vertical resize -2",
  ["<C-Right>"] = "vertical resize +2",
}

for _, mode in ipairs({ "n", "i", "v" }) do
  for key, cmd in pairs(resize_cmds) do
    map_resize(mode, key, cmd)
  end
end
