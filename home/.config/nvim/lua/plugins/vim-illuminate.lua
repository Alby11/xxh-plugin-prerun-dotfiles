local mapkey = require("util.keymapper").mapvimkey
local config = function()
	require("illuminate").configure({})
end

return {
	"RRethy/vim-illuminate",
	enabled = true,
	lazy = false,
	config = config,
}
