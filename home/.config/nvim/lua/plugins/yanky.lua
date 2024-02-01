local mapkey = require("util.keymapper").mapvimkey
local config = function()
	require("yanky").setup({})
	require("telescope").load_extension("yank_history")
end

local dependencies = {
	{
		"kkharji/sqlite.lua",
		enabled = false,
		lazy = false,
	},
	{
		"hrsh7th/nvim-cmp",
	},
}

local opts = {
	ring = {
		history_length = 1000,
		-- storage = "sqlite",
		storage = "shada",
		-- storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
		sync_with_numbered_registers = true,
		cancel_event = "update",
		ignore_registers = { "_" },
		update_register_on_cycle = false,
	},
	picker = {
		select = {
			action = nil, -- nil to use default put action
		},
		telescope = {
			use_default_mappings = false, -- if default mappings should be used
			mappings = nil, -- nil to use default mappings or no mappings (see `use_default_mappings`)
		},
	},
	system_clipboard = {
		sync_with_ring = true,
	},
	highlight = {
		on_put = true,
		on_yank = true,
		timer = 500,
	},
	preserve_cursor_position = {
		enabled = true,
	},
	textobj = {
		enabled = true,
	},
}

local keys = {
	{ "p", "<Plug>(YankyPutAfter)", { "n", "x" }, noremap = true, silent = true, desc = "Put after with Yank" },
	{ "P", "<Plug>(YankyPutBefore)", { "n", "x" }, noremap = true, silent = true, desc = "Put before with Yank" },
	{ "gp", "<Plug>(YankyGPutAfter)", { "n", "x" }, noremap = true, silent = true, desc = "GPut after with Yank" },
	{ "gP", "<Plug>(YankyGPutBefore)", { "n", "x" }, noremap = true, silent = true, desc = "GPut before with Yank" },
	{ "<c-p>", "<Plug>(YankyPreviousEntry)", "n", noremap = true, silent = true, desc = "Yanky previous entry" },
	{ "<c-n>", "<Plug>(YankyNextEntry)", "n", noremap = true, silent = true, desc = "Yanky next entry" },
	{
		"]p",
		"<Plug>(YankyPutIndentAfterLinewise)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent after linewise",
	},
	{
		"[p",
		"<Plug>(YankyPutIndentBeforeLinewise)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent before linewise",
	},
	{
		"]P",
		"<Plug>(YankyPutIndentAfterLinewise)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent after linewise with capital P",
	},
	{
		"[P",
		"<Plug>(YankyPutIndentBeforeLinewise)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent before linewise with capital P",
	},
	{
		">p",
		"<Plug>(YankyPutIndentAfterShiftRight)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent after shift right",
	},
	{
		"<p",
		"<Plug>(YankyPutIndentAfterShiftLeft)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent after shift left",
	},
	{
		">P",
		"<Plug>(YankyPutIndentBeforeShiftRight)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent before shift right",
	},
	{
		"<P",
		"<Plug>(YankyPutIndentBeforeShiftLeft)",
		"n",
		noremap = true,
		silent = true,
		desc = "Yanky put indent before shift left",
	},
	{ "=p", "<Plug>(YankyPutAfterFilter)", "n", noremap = true, silent = true, desc = "Yanky put after filter" },
	{ "=P", "<Plug>(YankyPutBeforeFilter)", "n", noremap = true, silent = true, desc = "Yanky put before filter" },
	{
		"<leader>fy",
		":Telescope yank_history<CR>",
		"n",
		noremap = true,
		silent = true,
		desc = "Telescope yank history",
	},
}

return {
	-- yanky and sqlite are managed as LazyVim extras
	-- but you need to initialize yanky on your own
	{
		"gbprod/yanky.nvim",
		enabled = false,
		event = "VeryLazy",
		dependencies = dependencies,
		config = config,
		opts = opts,
		keys = keys,
	},
}
