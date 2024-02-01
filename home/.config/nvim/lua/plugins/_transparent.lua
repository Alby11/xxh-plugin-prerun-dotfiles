local plugin_name = "transparent"

if not CheckPlugin(plugin_name) then
	return
end

require(plugin_name).setup({
	-- enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- example of akinsho/nvim-bufferline.lua
		-- "BufferLineTabClose",
		-- "BufferlineBufferSelected",
		-- "BufferLineFill",
		-- "BufferLineBackground",
		-- "BufferLineSeparator",
		-- "BufferLineIndicatorSelected",
		"all",
	},
	exclude_groups = {}, -- table: groups you don't want to clear
})

Map("n", "<leader>TT", "<cmd>TransparentToggle<cr>", Opts)
