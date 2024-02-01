if not Is_vscode then
	-- Tab / Indentation
	Opt.tabstop = 2
	Opt.shiftwidth = 2
	Opt.softtabstop = 2
	Opt.expandtab = true
	Opt.smartindent = true
	Opt.wrap = false

	-- Search
	Opt.incsearch = true
	Opt.ignorecase = true
	Opt.smartcase = true
	Opt.hlsearch = false

	-- Appearance
	Opt.number = true
	Opt.relativenumber = true
	Opt.termguicolors = true
	Opt.colorcolumn = "100"
	Opt.signcolumn = "yes"
	Opt.cmdheight = 1
	Opt.scrolloff = 10
	Opt.completeopt = "menuone,noinsert,noselect"

	-- Behaviour
	Opt.hidden = true
	Opt.errorbells = false
	Opt.swapfile = false
	Opt.backup = false
	Opt.undodir = vim.fn.expand("~/.vim/undodir")
	Opt.undofile = true
	Opt.backspace = "indent,eol,start"
	Opt.splitright = true
	Opt.splitbelow = true
	Opt.autochdir = false
	Opt.iskeyword:append("-")
	Opt.selection = "exclusive"
	Opt.mouse = "a"

	-- clipboard block
	-- Opt.clipboard:append("unnamedplus")
	Opt.clipboard = "unnamedplus"

	-- set modifiable as default
	Opt.modifiable = true

	Opt.guicursor = {
		"n-v:block-Cursor", -- Normal and Visual mode - Block cursor with custom color
		"i:ver25-CursorI", -- Insert mode - Vertical bar 25% width with a different color
		"c:hor20-CursorX", -- Command-line mode - Horizontal bar 20% width
		"r-cr:hor20-CursorR", -- Replace mode - Horizontal bar 20% width with unique color
		"o:hor50-CursorOP", -- Operator-pending mode - Horizontal bar 50% width
		"a:blinkwait700-blinkoff400-blinkon250", -- Blink settings for all modes
		"sm:block-blinkwait175-blinkoff150-blinkon175-CursorSM", -- Select mode - Block with different blink rate
	}

	-- Opt.onally, you can define custom colors for Cursor, CursorI, CursorR in your colorscheme or separately
	-- For example:
	Cmd([[highlight Cursor guifg=#89b4fa guibg=#89b4fa ]]) -- Blue for Normal Mode
	Cmd([[highlight CursorI guifg=#f5c2e7 guibg=#f5c2e7 ]]) -- Pink for Insert Mode
	Cmd([[highlight CursorX guifg=#f38ba8 guibg=#f38ba8 ]]) -- Red for Command-line Mode
	Cmd([[highlight CursorR guifg=#a6e3a1 guibg=#a6e3a1 ]]) -- Green for Replace Mode

	Opt.encoding = "UTF-8"
	Opt.showmode = false

	-- folds
	Opt.foldmethod = "expr"
	Opt.foldexpr = "nvim_treesitter#foldexpr()"
	Opt.foldlevel = 99
end
