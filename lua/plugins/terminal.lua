-- File Explorer / Tree
return {
  "akinsho/toggleterm.nvim",
  tag = "v2.12.0",
  lazy = false,
  opts = {
    highlights = {
      -- Clear the background of the status line
      StatusLine = {
        guibg = "NONE",
      },
      -- Hide the text in the status line
      StatusLineNC = {
        guifg = "NONE",
        guibg = "NONE",
      },
    },
    -- Optionally, you can set the height of the status line to 0
    -- This will completely remove the space taken by the status line
    statusline = {
      enabled = false,
      -- or
      -- height = 0,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    function SpawnTerminalRight()
      local current_term = vim.b.toggle_number
      vim.cmd("wincmd l")
      if current_term then
        vim.cmd("ToggleTerm " .. (current_term + 1))
      else
        vim.cmd("ToggleTerm")
      end
    end

    -- Keymaps
    local keymap = vim.keymap.set
    keymap("n", "<Leader>tt", "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", { noremap = true, silent = true })
    keymap(
      "t",
      "<Leader>tt",
      "<C-\\><C-n><Cmd>ToggleTerm size=10 direction=horizontal<CR>",
      { noremap = true, silent = true }
    )

    keymap("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })

    keymap("n", "<Leader>tv", SpawnTerminalRight, { noremap = true, silent = true })
    keymap("t", "<Leader>tv", "<C-\\><C-n><Cmd>lua SpawnTerminalRight()<CR>", { noremap = true, silent = true })
  end,
}
