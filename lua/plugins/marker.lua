return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  commit = "a84ab829eaf3678b586609888ef52f7779102263",
  lazy = false,
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup()

    vim.keymap.set("n", "<leader>hx", function()
      harpoon:list():add()
    end)

    vim.keymap.set("n", "<leader>hl", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<leader>hp", function()
      harpoon:list():prev()
    end)
    vim.keymap.set("n", "<leader>hn", function()
      harpoon:list():next()
    end)

    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end)
  end,
}
