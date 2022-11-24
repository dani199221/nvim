-- impory vs-tasks plugin safely
local status, vstask = pcall(require, "vstask")
if not status then
	print("vstask is not setup")
	return
end

vstask.setup({
	cache_strategy = "last", -- can be "most" or "last" (most used / last used)
	telescope_keys = { -- change the telescope bindings used to launch tasks
		vertical = "<C-v>",
		split = "<C-p>",
		tab = "<C-t>",
		current = "<CR>",
	},
	autodetect = { -- auto load scripts
		npm = "on",
	},
	terminal = "toggleterm",
	term_opts = {
		vertical = {
			direction = "vertical",
			size = "80",
		},
		horizontal = {
			direction = "horizontal",
			size = "10",
		},
		current = {
			direction = "float",
		},
		tab = {
			direction = "tab",
		},
	},
})
