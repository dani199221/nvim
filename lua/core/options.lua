local opt = vim.opt

opt.showmatch = true -- show matching

opt.ignorecase = true -- case insensitive
opt.smartcase = true -- smartcase
opt.wrap = false -- stop wrapping

opt.hlsearch = true -- highlight search
opt.incsearch = true -- incremental search
opt.cursorline = true -- cursorline
--opt.background="dark"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.encoding = "UTF-8"

opt.tabstop = 4 -- number of columns occupied by a tab
opt.shiftwidth = 4 -- width for autoindents
opt.expandtab = true -- converts tabs to white space
opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
opt.autoindent = true

opt.autoindent = true -- indent a new line the same amount as the line just typed
opt.number = true -- add line numbers
opt.relativenumber = true -- relative number
opt.termguicolors = true
