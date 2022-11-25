-- import nvim-notify plugin safely
local status, notify = pcall(require, "nvim-notify")
if not status then
	return
end

notify.setup()
vim.notify = notify
