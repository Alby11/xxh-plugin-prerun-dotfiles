local plugin_name = "toggleterm"

if not CheckPlugin(plugin_name) then
	return
end

require(plugin_name).setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-\>]],
	-- on_create = fun(t: Terminal), -- function to run when the terminal is first created
	-- on_open = fun(t: Terminal), -- function to run when the terminal opens
	-- on_close = fun(t: Terminal), -- function to run when the terminal closes
	-- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
	-- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
	-- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	highlights = {
		-- highlights which map to a highlight group name and a table of it's values
		-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		Normal = {
			guibg = "",
		},
		NormalFloat = {
			link = "Normal",
		},
		FloatBorder = {
			guifg = "",
			guibg = "",
		},
	},
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = false, -- if set to true (default) the previous terminal mode will be remembered
	direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float',
	close_on_exit = true, -- close the terminal window when the process exits
	shell = Shell, -- change the default shell
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	-- This field is only relevant if direction is set to 'float'
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})

-- lazygit
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
	lazygit:toggle()
end
Map("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", Opts)

function _G.set_terminal_keymaps()
	Map("t", "<esc>", [[<C-\><C-n>]], Opts)
	Map("t", "jk", [[<C-\><C-n>]], Opts)
	-- Map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], Opts)
	-- Map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], Opts)
	-- Map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], Opts)
	-- Map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], Opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- Cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
Cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

function toggle_term_in_current_dir()
	local term = Terminal:new({
		-- cmd = "zsh",
		cmd = "zsh -c 'cd " .. vim.fn.expand("%:p:h") .. "; zsh'",
		hidden = true,
		-- dir = vim.fn.getcwd(),
	})

	term:toggle()
end

-- You can then map this function to a key of your choice
Map("n", "<leader>st", "<Cmd>lua toggle_term_in_current_dir()<CR>", Opts)
Map("n", "<Leader>sL", "<Cmd>ToggleTermSendCurrentLine<CR>", Opts)
Map("x", "<Leader>sv", "<Cmd>ToggleTermSendVisualLines<CR>", Opts)
Map("x", "<Leader>sV", "<Cmd>ToggleTermSendVisualSelection<CR>", Opts)
