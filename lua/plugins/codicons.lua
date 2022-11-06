-- import nvim-autopairs safely
local autopairs_setup, codicons = pcall(require, "codicons")
if not autopairs_setup then
	return
end


codicons.setup({
  -- Override by mapping name to icon
  ['account'] = '',
  -- Or by name to hexadecimal/decimal value
  ['comment'] = 0xEA6B, -- hexadecimal
  ['archive'] = 60056, -- decimal
})


