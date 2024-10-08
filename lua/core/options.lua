local opt = vim.opt

-- Line Numbers
opt.relativenumber = true -- show line numbers relative to the current line
opt.number = true -- display absolute line numbers
opt.scrolloff = 8 -- keep at least 8 lines visible above and below the cursor when scrolling
opt.breakindent = true -- wrap indent to match  line start
opt.clipboard = "unnamedplus" -- connection to the system clipboard
opt.cmdheight = 0 -- hide command line unless needed
opt.completeopt = { "menu", "menuone", "noselect" } -- Options for insert mode completion
opt.copyindent = true -- copy the previous indentation on autoindenting
opt.cursorline = true -- highlight the text line of the cursor
opt.expandtab = true -- enable the use of space in tab
opt.fileencoding = "utf-8" -- file content encoding for the buffer
opt.fillchars = { eob = " " } -- disable `~` on nonexistent lines
opt.foldenable = true -- enable fold for nvim-ufo
opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
opt.foldlevelstart = 99 -- start with all code unfolded
opt.foldcolumn = "1" -- show foldcolumn in nvim 0.9
opt.history = 100 -- number of commands to remember in a history table
opt.ignorecase = true -- case insensitive searching
opt.infercase = true -- infer cases in keyword completion
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- wrap lines at 'breakat'
opt.mouse = "a" -- enable mouse support
opt.number = true -- show numberline
opt.preserveindent = true -- preserve indent structure as much as possible
opt.pumheight = 10 -- height of the pop up menu
opt.relativenumber = true -- show relative numberline
opt.shiftwidth = 2 -- number of space inserted for indentation
opt.showmode = false -- disable showing modes in command line
opt.showtabline = 2 -- always display tabline
opt.signcolumn = "yes" -- always show the sign column
opt.smartcase = true -- case sensitive searching
opt.splitbelow = true -- splitting a new window below the current one
opt.splitright = true -- splitting a new window at the right of the current one
opt.tabstop = 2 -- number of space in a tab
opt.termguicolors = true -- enable 24-bit RGB color in the TUI
opt.timeoutlen = 500 -- shorten key timeout length a little bit for which-key
opt.title = true -- set terminal title to the filename and path
opt.undofile = true -- enable persistent undo
opt.updatetime = 300 -- length of time to wait before triggering the plugin
opt.virtualedit = "block" -- allow going past end of line in visual block mode
opt.wrap = false -- disable wrapping of lines longer than the width of window
opt.writebackup = false -- disable making a backup before overwriting a file

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
