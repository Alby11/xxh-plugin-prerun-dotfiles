local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	Api.nvim_set_hl(0, "RainbowRed", { fg = "#ff6c6b" }) -- Mocha Red
	Api.nvim_set_hl(0, "RainbowYellow", { fg = "#ECBE7B" }) -- Mocha Yellow
	Api.nvim_set_hl(0, "RainbowBlue", { fg = "#51afef" }) -- Mocha Blue
	Api.nvim_set_hl(0, "RainbowOrange", { fg = "#da8548" }) -- Mocha Orange
	Api.nvim_set_hl(0, "RainbowGreen", { fg = "#98be65" }) -- Mocha Green
	Api.nvim_set_hl(0, "RainbowViolet", { fg = "#c678dd" }) -- Mocha Violet
	Api.nvim_set_hl(0, "RainbowCyan", { fg = "#46D9FF" }) -- Mocha Cyan
end)

require("ibl").setup({ indent = { highlight = highlight } })
