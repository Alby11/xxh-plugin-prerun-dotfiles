local mapkey = require("util.keymapper").mapvimkey
local keys = {
	{ "<leader>Zn", "<cmd>SudaRead<CR>", { silent = true, noremap = true, desc = "Sudo read file" } },
	{ "<leader>Zw", "<cmd>SudaWrite<CR>", { silent = true, noremap = true, desc = "Sudo write file" } },
}
return {
	-- Suda to sudo
	{
		"lambdalisue/suda.vim",
		enabled = true,
		event = "BufEnter",
		keys = keys,
	},
}
