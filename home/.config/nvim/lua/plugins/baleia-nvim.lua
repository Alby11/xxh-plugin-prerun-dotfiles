local mapkey = require("util.keymapper").mapvimkey
local config = function()
	-- Require and setup baleia
	local baleia = require("baleia").setup({})

	-- Command: BaleiaColorize
	vim.api.nvim_create_user_command("BaleiaColorize", function()
		baleia.once(vim.fn.bufnr("%"))
	end, {})

	-- Autocommand for BufWinEnter
	vim.api.nvim_create_autocmd("BufWinEnter", {
		pattern = "my-buffer",
		callback = function()
			baleia.automatically(vim.fn.bufnr("%"))
		end,
	})

	-- Autocommand for BufReadPost on quickfix
	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = "quickfix",
		callback = function()
			vim.bo.modifiable = true
			baleia.once(vim.fn.bufnr("%"))
			vim.bo.modifiable = false
		end,
	})
end

local keys = {
	mapkey("<leader>bc", "BaleiaColorize", "n"),
}

return {
	{
		"m00qek/baleia.nvim",
		tag = "v1.3.0",
		event = "BufEnter",
		config = config,
		keys = keys,
	},
}
