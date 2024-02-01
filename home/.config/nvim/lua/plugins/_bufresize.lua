local plugin_name = "bufresize"
-- import plugin safely
local plugin_status, bufresize = pcall(require, plugin_name)
if not plugin_status then
	return
end

bufresize.setup({
	register = {
		keys = {
			{ "n", "<C-w><", "<C-w><", Opts },
			{ "n", "<C-w>>", "<C-w>>", Opts },
			{ "n", "<C-w>+", "<C-w>+", Opts },
			{ "n", "<C-w>-", "<C-w>-", Opts },
			{ "n", "<C-w>_", "<C-w>_", Opts },
			{ "n", "<C-w>=", "<C-w>=", Opts },
			{ "n", "<C-w>|", "<C-w>|", Opts },
			{ "", "<LeftRelease>", "<LeftRelease>", Opts },
			{ "i", "<LeftRelease>", "<LeftRelease><C-o>", Opts },
		},
		trigger_events = { "BufWinEnter", "WinEnter" },
	},
	resize = {
		keys = {},
		trigger_events = { "VimResized" },
		increment = false,
	},
})

-- My personal usage for resize_open and resize_close is using with toggleterm.
-- Assuming you have the default configuration for setup, below is my configuration for toggleterm to not mess up the proportion when toggling.
ToggleTerm = function(direction)
	local command = "ToggleTerm"
	if direction == "horizontal" then
		command = command .. " direction=horizontal"
	elseif direction == "vertical" then
		command = command .. " direction=vertical"
	end
	if vim.bo.filetype == "toggleterm" then
		require("bufresize").block_register()
		vim.api.nvim_command(command)
		require("bufresize").resize_close()
	else
		require("bufresize").block_register()
		vim.api.nvim_command(command)
		require("bufresize").resize_open()
		cmd([[execute "normal! i"]])
	end
end
-- Map("n", "<C-s>", ":lua ToggleTerm()<cr>", Opts)
Map("n", "<leader>ot", [[:lua ToggleTerm("horizontal")<cr>]], Opts)
Map("n", "<leader>ol", [[:lua ToggleTerm("vertical")<cr>]], Opts)
-- Map("i", "<C-s>", "<esc>:lua ToggleTerm()<cr>", Opts)
-- Map("t", "<C-s>", "<C-\\><C-n>:lua ToggleTerm()<cr>", Opts)
