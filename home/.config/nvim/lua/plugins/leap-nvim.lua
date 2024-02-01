local dependencies = {
	"tpope/vim-repeat",
}
local config = function()
	require("leap").create_default_mappings(true)
end
return {
	"ggandor/leap.nvim",
	enabled = true,
	event = "BufEnter",
	dependencies = dependencies,
	config = config,
}
