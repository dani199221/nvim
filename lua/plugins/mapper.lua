-- import nvim-mapper plugin safely
local status, mapper = pcall(require, "mapper")
if not status then
	return
end

mapper.setup({
	-- do not assign the default keymap (<leader>MM)
	no_map = false,
	-- where should ripgrep look for your keybinds definitions.
	-- Default config search path is ~/.config/nvim/lua
	search_path = os.getenv("HOME") .. "/.config/nvim/lua",
	-- what should be done with the selected keybind when pressing enter.
	-- Available actions:
	--   * "definition" - Go to keybind definition (default)
	--   * "execute" - Execute the keybind command
	action_on_enter = "definition",
})
