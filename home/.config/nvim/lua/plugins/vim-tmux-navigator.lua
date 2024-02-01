local mapkey = require("util.keymapper").mapvimkey

local cmd = {
	"TmuxNavigateLeft",
	"TmuxNavigateDown",
	"TmuxNavigateUp",
	"TmuxNavigateRight",
	"TmuxNavigatePrevious",
}

local keys = {
	mapkey("<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr><cmd>", "n"),
	mapkey("<c-j>", "<cmd><C-U>TmuxNavigateDown<cr><cmd>", "n"),
	mapkey("<c-k>", "<cmd><C-U>TmuxNavigateUp<cr><cmd>", "n"),
	mapkey("<c-l>", "<cmd><C-U>TmuxNavigateRight<cr><cmd>", "n"),
	mapkey("<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr><cmd>", "n"),
}

return {
	{
		"christoomey/vim-tmux-navigator",
		enabled = true,
		event = "VeryLazy",
		cmd = cmd,
		keys = keys,
	},
}
