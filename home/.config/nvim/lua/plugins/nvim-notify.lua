local mapkey = require("util.keymapper").mapvimkey

local config = function()
	require("notify").setup({
		background_colour = "#000000",
	})
end

return {
	"rcarriga/nvim-notify",
	enabled = false,
	event = "VimEnter",
	config = config,
}
