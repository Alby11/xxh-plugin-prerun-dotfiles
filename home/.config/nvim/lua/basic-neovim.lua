-- Leader/local leader
G.mapleader = " "

-- Skip some remote provider loading
G.loaded_python3_provider = 0
G.loaded_node_provider = 0
G.loaded_perl_provider = 0
G.loaded_ruby_provider = 0

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
	"gzip",
	-- "man",
	"matchit",
	"matchparen",
	"netrwPlugin",
	"shada_plugin",
	"tar",
	"tarPlugin",
	"zip",
	"zipPlugin",
}

for i in ipairs(disabled_built_ins) do
	G["loaded_" .. disabled_built_ins[i]] = 1
end

-- Settings
Opt.autochdir = true -- cd to file dir
Opt.autoread = true -- set to auto read when a file is changed from the outside
Opt.backup = false -- Disable Backup
Opt.breakindent = true -- Enable break indent
Opt.cc = "80" -- set an 80 column border for good coding style
Opt.clipboard = "unnamedplus" -- using system clipboard if supported (vim --version and look for +clipboard or +xterm_clipboard)
Opt.cmdheight = 1 -- Better Error Messages
Opt.concealcursor = "nc"
Opt.conceallevel = 2
Opt.cursorline = true
Opt.display = "msgsep"
Opt.encoding = "utf-8"
Opt.fileencoding = "utf-8" -- Set File Encoding
Opt.guicursor = { "n-v-c:block", "i-ci-ve:ver25", "r-cr:hor20", "o:hor50" }
Opt.hidden = true -- Do not save when switching buffers
Opt.hlsearch = false -- Set highlight on search
Opt.ignorecase = true -- Case insensitive searching
Opt.inccommand = "nosplit" -- Incremental live completion
Opt.joinspaces = false
Opt.laststatus = 3
Opt.lazyredraw = true
Opt.list = true
Opt.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<,space:." -- see while spaces
Opt.modeline = false
Opt.modifiable = true
Opt.mouse = "a" -- Enable mouse mode
Opt.number = true -- Display Line Number
Opt.previewheight = 5
Opt.pumheight = 10 -- Pop up Menu Height
Opt.relativenumber = true -- Make relative line numbers default
Opt.scrolloff = 7 -- Vertical Scroll Offset
Opt.shada = [['20,<50,s10,h,/100]]
Opt.shortmess:append({ W = true, a = true })
Opt.shortmess = "c"
Opt.showmatch = true
Opt.showmode = false -- Don't Show MODES
Opt.showtabline = 2 -- Always Show Tabline
Opt.sidescrolloff = 8 -- Horizontal Scroll Offset
Opt.signcolumn = "yes" -- Sign Column
Opt.smartcase = true -- If Upper Case Char > case sensitive search
Opt.smartindent = true -- Smart Indenting
Opt.smarttab = true -- Smart Tabs
-- Tab set to two spaces
Opt.tabstop = 2
Opt.shiftwidth = 2
Opt.softtabstop = 2
Opt.expandtab = true -- Give me space
Opt.signcolumn = "yes"
Opt.spell = false -- enable spell check (may need to download language package)
Opt.spellfile = Config_dir .. "/spell/mywords.utf-8.add"
Opt.spelllang = "en,it,fr"
Opt.splitbelow = true -- Force Split Below
Opt.splitright = true -- Force Split Right
Opt.swapfile = false -- Don't create Swap Files
Opt.synmaxcol = 500
-- Opt.termencoding = "utf-8"
Opt.textwidth = 100
Opt.timeoutlen = 250 -- Time for mapped sequence to complete (in ms)
-- Opt.title = true -- Display File Info on Title
-- Opt.titlestring = true -- Display File Info on Title
Opt.undodir = Stdpath("cache") .. "/undo"
Opt.undofile = true -- Save undo history
Opt.whichwrap:append("<,>,h,l")
Opt.wildignore = { "*.o", "*~", "*.pyc" }
Opt.wildmode = "longest,full"
Opt.spelllang = { "en", "it", "fr" } -- enable spell check (may need to download language package)

-- -- Set shell
if is_win then
	Opt.shell = "pwsh -NoLogo"
	Opt.shellpipe = "|/"
	Opt.shellxquote = ""
	Opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	Opt.shellredir = "| Out-File -Encoding UTF8"
elseif is_wsl then
	Opt.shell = "/usr/bin/zsh"
elseif is_linux then
	Opt.shell = "/bin/zsh"
end
--
-- -- GUI Opt.ons
Opt.guifont = "CaskaydiaCove Nerd Font Retina:h10"
