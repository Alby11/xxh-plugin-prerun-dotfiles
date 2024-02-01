local mapkey = require("util.keymapper").mapvimkey
local opts = {
	-- Move the function from `config` here
	setup = function()
		local transparent = require("transparent")
		transparent.clear_prefix("lualine")
		transparent.clear_prefix("Bufferline")
		if config.transparent then
			vim.cmd("TransparentEnable")
		end
	end,
	-- The rest of your original `opts` configuration
	-- lualine_style = "default",
	lualine_style = "stealth",
	extra_groups = {
		"NormalFloat",
		"NvimTreeNormal",
		"NeoTreeNormal",
		"NeoTreeFloatBorder",
		"NeoTreeNormalNC",
	},
}

local keys = {
	mapkey("<leader>tt", "TransparentToggle", "n"),
}

return {
	{
		"xiyaowong/nvim-transparent",
		enabled = true,
		lazy = false,
		opts = opts, -- Use only `opts` here
		keys = keys,
	},
}
