vim.g.neo_tree_remove_legacy_commands = true

Map("n", "<Leader>n", "<Cmd>Neotree toggle reveal_force_cwd<CR>", Opts)

-- barbar.nvim integration
Autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			require("bufferline.state").set_offset(31, "FileTree")
		end
	end,
})

Autocmd("BufWinLeave", {
	pattern = "*",
	callback = function()
		if vim.fn.expand("<afile>"):match("NvimTree") then
			require("bufferline.state").set_offset(0)
		end
	end,
})
