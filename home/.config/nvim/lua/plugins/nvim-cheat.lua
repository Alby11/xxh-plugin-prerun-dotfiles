local mapkey = require("util.keymapper").mapvimkey

local dependencies = {
	"RishabhRD/popfix",
}

local config = function()
	require("nvim-cheat")
end

local keys = {
	mapkey("<leader>cc", "Cheat", "n", { silent = true, noremap = true, desc = "Cheat.sh prompt" }), -- Call Dashboard
	mapkey("<leader>cl", "CheatList", "n", { silent = true, noremap = true, desc = "Cheat.sh cheat list" }), -- Call Dashboard
}

return {
	"RishabhRD/nvim-cheat.sh",
	enabled = true,
	event = "VimEnter",
	dependencies = dependencies,
	config = config,
	keys = keys,
}
