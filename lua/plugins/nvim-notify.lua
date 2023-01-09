-- import nvim-notify plugin safely
local status, notify = pcall(require, "notify")
if not status then
	print("Notify not setup")
	return
end

notify.setup({
	stages = "fade_in_slide_out",
	background_colour = "FloatShadow",
	timeout = 3000,
})

vim.notify = notify

--vim.notify("Testing notification")
