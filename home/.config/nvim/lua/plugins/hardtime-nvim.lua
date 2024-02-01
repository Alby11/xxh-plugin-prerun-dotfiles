local mapkey = require("util.keymapper").mapvimkey
local dependencies = {
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
}
local config = function()
	require("hardtime").setup()
end
local opts = {
	-- Add "oil" to the disabled_filetypes
	disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil" },
}
return {
	"m4xshen/hardtime.nvim",
	enabled = true,
	event = "BufEnter",
	dependencies = dependencies,
	config = config,
	opts = opts,
}
