local config = function()
	require("targets.vim")
end
return {
	"wellle/targets.vim",
	enabled = false,
	event = "BufEnter",
	config = config,
}
