local mapkey = require("util.keymapper").mapvimkey

local config = function()
	local wk = require("which-key")
	wk.register({
		Z = {
			name = "+suda", -- optional group name
			-- r = { "<cmd>sudaread<cr>", "suda read", noremap=true, silent = true }, -- additional options for creating the keymap
			-- w = { "<cmd>SudaWrite<cr>", "Suda write", noremap=true, silent = true }, -- additional options for creating the keymap
			-- ["a"] = "which_key_ignore",  -- special label to hide it in the popup
		},
		{ prefix = "<leader>" },
	})
end

local init = function()
	vim.o.timeout = true
	vim.o.timeoutlen = 100
end

return {
	"folke/which-key.nvim",
	lazy = false,
	init = init,
	config = config,
	opts = {},
}
