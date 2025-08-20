local opt = vim.opt

-- Line Numbers
opt.number = true                                   -- show numberline
opt.relativenumber = true                           -- show relative numberline
opt.scrolloff = 8                                   -- keep at least 8 lines visible above and below the cursor when scrolling

-- Editor Behavior
opt.breakindent = true                              -- wrap indent to match  line start
opt.clipboard = "unnamedplus"                       -- connection to the system clipboard
opt.cmdheight = 0                                   -- hide command line unless needed
opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion
opt.copyindent = true                               -- copy the previous indentation on autoindenting
opt.cursorline = true                               -- highlight the text line of the cursor
opt.expandtab = true                                -- enable the use of space in tab
opt.fileencoding = "utf-8"                          -- file content encoding for the buffer
opt.fillchars = { eob = " " }                       -- disable `~` on nonexistent lines
opt.history = 100                                   -- number of commands to remember in a history table
opt.ignorecase = true                               -- case insensitive searching
opt.infercase = true                                -- infer cases in keyword completion
opt.linebreak = true                                -- wrap lines at 'breakat'
opt.mouse = "a"                                     -- enable mouse support
opt.preserveindent = true                           -- preserve indent structure as much as possible
opt.pumheight = 10                                  -- height of the pop up menu

-- Folding
opt.foldenable = true                               -- enable fold for nvim-ufo
opt.foldlevel = 99                                  -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99                             -- start with all code unfolded
opt.foldcolumn = "1"                                -- show foldcolumn in nvim 0.9

-- Search
opt.smartcase = true                                -- case sensitive searching

-- Indentation
opt.shiftwidth = 2                                  -- number of space inserted for indentation
opt.tabstop = 2                                     -- number of space in a tab

-- UI
opt.laststatus = 3                                  -- global statusline
opt.showmode = false                                -- disable showing modes in command line
opt.showtabline = 2                                 -- always display tabline
opt.signcolumn = "yes"                              -- always show the sign column
opt.termguicolors = true                            -- enable 24-bit RGB color in the TUI
opt.title = true                                    -- set terminal title to the filename and path

-- Windows
opt.splitbelow = true                               -- splitting a new window below the current one
opt.splitright = true                               -- splitting a new window at the right of the current one

-- Performance
opt.timeoutlen = 500                                -- shorten key timeout length a little bit for which-key
opt.updatetime = 300                                -- length of time to wait before triggering the plugin

-- Files
opt.autoread = true                                 -- automatically read the file when changed outside of vim
opt.undofile = true                                 -- enable persistent undo
opt.writebackup = false                             -- disable making a backup before overwriting a file

-- Editing
opt.virtualedit = "block"                           -- allow going past end of line in visual block mode
opt.wrap = false                                    -- disable wrapping of lines longer than the width of window

-- LSP UI
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
