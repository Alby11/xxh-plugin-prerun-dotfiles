local plugin_name = "baleia"
-- import plugin safely
local plugin_status, baleia = pcall(require, plugin_name)
if not plugin_status then
	return
end
Cmd([[
" baleia_setup.vim
let s:baleia = luaeval("require('baleia').setup { }")
command! BaleiaColorize call s:baleia.once(bufnr('%'))
autocmd BufWinEnter my-buffer call s:baleia.automatically(bufnr('%'))
]])
Map("n", "<leader>ba", ":BaleiaColorize<ent>", Opts)
