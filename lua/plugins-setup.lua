local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

return lazy.setup({

	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	"bluz71/vim-nightfly-guicolors", -- preferred colorscheme
	"EdenEast/nightfox.nvim",
	"ryanoasis/vim-devicons",
	"bryanmylee/vim-colorscheme-icons",
	"Mofiqul/vscode.nvim",

	-- file explorer
	"nvim-tree/nvim-tree.lua",

	-- vs-code like icons
	"kyazdani42/nvim-web-devicons",

	-- statusline
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			local telescope_setup, telescope = pcall(require, "telescope")
			telescope.setup()
			--telescope.load_extension("fzy_native")
			--telescope.load_extension("fzf")
			telescope.load_extension("toggletasks")
			telescope.load_extension("notify")
			--telescope.load_extension("media_files")
		end,
	},

	-- fuzzy finder

	-- autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion
	"rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
	"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		{ "glepnir/lspsaga.nvim", branch = "main" },
	}, -- enhanced lsp uis
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	{
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			dependencies = {
				"windwp/nvim-ts-autotag",
			},
		},
	},

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	-- terminal in nvim
	"akinsho/toggleterm.nvim",

	--run tasks from nvim
	"nvim-lua/popup.nvim",
	"jedrzejboczar/toggletasks.nvim",
	{

		"stevearc/overseer.nvim",
		config = function()
			require("overseer").setup()
		end,
	},

	--clangFormatter for c/cpp code
	--"rhysd/vim-clang-format",

	--fancy notification
	"rcarriga/nvim-notify",

	--status column
	"luukvbaal/statuscol.nvim",

	{
		"rebelot/heirline.nvim",

		config = function()
			require("heirline").setup({})
		end,
	},

	-- additional settings for clangd
	"p00f/clangd_extensions.nvim",

	-- barbar
	"kdheepak/lazygit.nvim",
	"romgrk/barbar.nvim",

	-- Add chatgpt to nvim
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	--"ianding1/leetcode.vim",
	-- image previewer in nvim
	--"nvim-telescope/telescope-media-files.nvim",

	--racket
	--"wlangstroth/vim-racket",
	--"Olical/conjure",
	--
})
