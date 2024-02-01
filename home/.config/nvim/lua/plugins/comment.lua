local mapkey = require("util.keymapper").mapvimkey

local opts = {
	---Enable keybindings
	---NOTE: If given `false` then the plugin won't create any mappings
	mappings = {
		---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
		basic = true,
		---Extra mapping; `gco`, `gcO`, `gcA`
		extra = true,
	},
}

return {
	"numToStr/Comment.nvim",
	event = "BufEnter",
	opts = opts,
}
