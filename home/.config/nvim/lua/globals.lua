vim = vim
g = vim.g
cmd = vim.cmd
api = vim.api
autocmd = api.nvim_create_autocmd
execute = api.nvim_command
map = api.nvim_set_keymap
fn = vim.fn
executable = vim.executable
exists = fn.exists
has = function(x)
	return fn.has(x) == 1
end
stdpath = fn.stdpath
systemlist = fn.systemlist
executable = function(x)
	return executable(x) == 1
end
opts = { silent = true, noremap = true }
is_wsl = (function()
	output = systemlist("uname -r")
	return not not string.find(output[1] or "", "WSL")
end)()
is_mac = has("macunix")
is_win = has("win32")
is_linux = not is_wsl and not is_mac and not is_win
is_vscode = exists("g:vscode") == 1
is_neovide = exists("g:neovide") == 1
is_fvim = exists("g:fvim_loaded") == 1
max_jobs = nil
if is_mac then
	max_jobs = 32
end
--
Vim = vim
G = Vim.g
Cmd = Vim.cmd
Api = Vim.api
Autocmd = Api.nvim_create_autocmd
Augroup = Api.nvim_create_augroup
Command = Api.nvim_create_user_command
Execute = Api.nvim_command
Map = Api.nvim_set_keymap
Mapv = vim.keymap.set
Opts = { silent = true, noremap = true }
Fn = Vim.fn
Executable = Vim.executable
Exists = Fn.exists
Has = function(x)
	return Fn.has(x) == 1
end
Notify = Vim.notify
O = Vim.o
Shell = O.shell
Opt = Vim.opt
Stdpath = Fn.stdpath
Systemlist = Fn.systemlist
Executable = function(x)
	return Executable(x) == 1
end
Is_wsl = (function()
	Output = Systemlist("uname -r")
	return not not string.find(Output[1] or "", "WSL")
end)()
Is_mac = Has("macunix")
Is_win = Has("win32")
Is_linux = not Is_wsl and not Is_mac and not Is_win
Is_vscode = Exists("g:vscode") == 1
Is_neovide = Exists("g:neovide") == 1
Is_fvim = Exists("g:fvim_loaded") == 1
Max_jobs = nil
if Is_mac then
	Max_jobs = 32
end
Termguicolors = Has("termguicolors")
Colorscheme = "catppuccin"
-- set config directory
Config_dir = Stdpath("config")
Plugins_dir = string.format("%s/lua/plugins", Config_dir)
-- avoid warnings
_G = _G
pcall = pcall
print = print
require = require
string = string
tostring = tostring

function IsDir(name)
	if type(name) ~= "string" then
		return false
	end
	return os.execute("test -d " .. name)
end

function IsFile(name)
	if type(name) ~= "string" then
		return false
	end
	return os.execute("test -f " .. name)
end

function Exists(name)
	if type(name) ~= "string" then
		return false
	end
	return os.execute("test -e " .. name)
end
