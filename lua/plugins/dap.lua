-- import dap plugin safely
local status, dap = pcall(require, "dap")
if not status then
	return
end

-- import dap-ui plugin safely
local status, dapui = pcall(require, "dapui")
if not status then
	return
end

local mappings = {
	["<Up>"] = dap.continue,
	["<Down>"] = dap.step_over,
	["<Right>"] = dap.step_into,
	["<Left>"] = dap.step_out,
	["<leader>b"] = dap.toggle_breakpoint,
	["<M-t>"] = function()
		dapui.toggle({ reset = true })
	end,
	["<M-k>"] = dapui.eval,
	["<leader>m"] = dapui.float_element,
	["<M-v>"] = function()
		dapui.float_element("scopes")
	end,
	["<M-r>"] = function()
		dapui.float_element("repl")
	end,
	["<leader>qq"] = dap.close,
}
for keys, mapping in pairs(mappings) do
	vim.api.nvim_set_keymap("n", keys, "", { callback = mapping, noremap = true })
end

--[[
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/home/dnnawaz/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7', -- adjust as needed, must be absolute path
}
dap.adapters.c =  dap.adapters.cpp:


dap.configurations.c = {
        name = "JediJolt page debug",
        type = "cppdbg",
        request = "launch",
        cwd = '${workspaceFolder}/rw_spi_color_linux_jedi/',
        program = function()return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')end,
        externalTerminal = false,
        stopOnEntry = true,
        args = {
    },

      {
    name = 'Attach to gdbserver :4242',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:4242',
    miDebuggerPath = '/usr/bin/arm-none-eabi-gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },

}

dap.configurations.cpp =  dap.configurations.c
 --]]

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has("nvim-0.7"),
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
				"stacks",
				"watches",
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
				"console",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},

	controls = {
		-- Requires Neovim nightly (or 0.8 when released)
		enabled = true,
		-- Display controls in this element
		element = "repl",
		icons = {
			pause = "pause",
			play = "play",
			step_into = "sinto",
			step_over = "sover",
			step_out = "sout",
			step_back = "sback",
			run_last = "↻",
			terminate = "X",
		},
	},

	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "rounded", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
	},
})

dap.set_log_level("TRACE")

--dapui.float_element(<element^ ID>, <optional settings>)

-- Automatically open UI
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Enable virtual text
vim.g.dap_virtual_text = true

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })
