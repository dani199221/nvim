-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"cpp",
		"c",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"markdown",
		"json",
		"gitignore",
		"python",
	},
	-- auto install above language parsers
	auto_install = true,
})
