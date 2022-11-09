-- import nvim-notify plugin safely
local status, notify = pcall(require, "nvim-notify")
if not status then
	return
end

-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end


vim.notify =  require("notify")
