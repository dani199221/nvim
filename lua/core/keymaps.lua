vim.g.mapleader = " "

local keymap = vim.keymap --keymap variable

-- clear search highlights
keymap.set("n", "<leader>h", ":nohl<CR>", { silent = true })

-- switch between windows
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- nvim-tree
keymap.set("n", "<leader>ne", ":NvimTreeFocus<CR>", { silent = true }) -- toggle file explorer
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true }) -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
-- vstasks
keymap.set("n", "<leader>ta", "<cmd>Telescope toggletasks spawn <cr>") -- list available help tags
keymap.set("n", "<leader>ts", "<cmd>Telescope toggletasks select<cr>") --open the input list, set new input
keymap.set("n", "<leader>te", "<cmd>Telescope toggletasks edit<cr>") -- search history of tasks
-- ClangFormat
keymap.set("n", "<leader>=", "<cmd>ClangFormat<cr>") -- Format whole file

--Barbar
local opts = { noremap = true, silent = true }

-- Move to previous/next
keymap.set("n", "gT", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "gt", "<Cmd>BufferNext<CR>", opts)
keymap.set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
-- P-- Pin/unpin buffer
keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
keymap.set("n", "<leader>bp", "<Cmd>BufferPin<CR>", opts)
-- C-- Close buffer
keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
keymap.set("n", "<leader>bc", "<Cmd>BufferClose<CR>", opts)

-- Lazygit
keymap.set("n", "<leader>gg", "<Cmd>LazyGit<CR>", opts)

-- Racket Eval
keymap.set("n", "<leader>E", "<Cmd>ConjureEval<CR>", opts)
keymap.set("n", "<leader>EE", "<Cmd>ConjureEvalBuf<CR>", opts)

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>lr", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- chatgpt keys
keymap.set("n", "<leader>gp", ":ChatGPT<CR>") -- mapping to restart lsp if necessary
