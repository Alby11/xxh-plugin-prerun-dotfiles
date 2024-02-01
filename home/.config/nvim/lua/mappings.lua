-- Functional wrapper for mapping custom keybindings
if Is_vscode then
	Map("n", "z=", "vim.fn.VSCodeNotify('keyboard-quickfix.openQuickFix')<cr>", Opts)
	Map("x", "gc", "<Plug>VSCodeCommentary", {})
	Map("n", "gc", "<Plug>VSCodeCommentary", {})
	Map("o", "gc", "<Plug>VSCodeCommentary", {})
	Map("n", "gcc", "<Plug>VSCodeCommentaryLine", {})
end

-- toggle search highlight
Cmd([[
    nnoremap <silent><expr> <Leader>HH (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
]])

-- toggle spell check
Mapv("n", "<Leader>SS", function()
	O.spell = not O.spell
	print(string.format("spell: %s", tostring(O.spell)))
end, Opts)

-- Open buffers.
Map("n", "<leader>bo", "<cmd>enew<cr>", Opts) -- quit

-- Quit, close buffers, etc.
Map("n", "<leader>q", "<cmd>q<cr>", Opts) -- quit
Map("n", "<leader>a", "<cmd>qa<cr>", Opts) -- quit all
Map("n", "<leader>Q", "<cmd>q!<cr>", Opts) -- force quit like ZQ
Map("n", "<leader>A", "<cmd>qa!<cr>", Opts) -- force quit all
-- 	Like ":wq" and ZZ shortcut, but write only when changes have been made.
Map("n", "<leader>X", "<cmd>x!<cr>", Opts)

-- Save buffer
Map("i", "<c-s>", "<esc><cmd>w<cr>a", Opts)
Map("n", "<leader>w", "<cmd>w<cr>", Opts)
Map("n", "<leader>W", "<cmd>w!<cr>", Opts)
Map("n", "<leader>sw", "<cmd>SudaWrite<cr>", Opts)

-- Read buffer
Map("n", "<leader>sr", "<cmd>SudaRead<cr>", Opts)

-- cd to buffer
Map("n", "<leader>cd", "<cmd>cd %:h|pwd<cr>", Opts)

-- print current directory
Map("n", "<leader>pwd", "<cmd>pwd<cr>", Opts)

Map("i", "kj", [[<Esc>]], Opts)
Map("v", "kj", [[<Esc>]], Opts)
Map("c", "kj", [[<C-C>]], Opts)
Map("t", "kj", [[<C-\><C-n>]], Opts)

-- Window movement
-- Map("n", "<c-h>", "<c-w>h", Opts)
-- Map("n", "<c-j>", "<c-w>j", Opts)
-- Map("n", "<c-k>", "<c-w>k", Opts)
-- Map("n", "<c-l>", "<c-w>l", Opts)

-- restart lsp server (not on youtube nvim video)
Map("n", "<leader>lspr", ":LspRestart<CR>", Opts) -- mapping to restart lsp if necessary
