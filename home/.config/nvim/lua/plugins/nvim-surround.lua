local opts = {
	function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}

return {
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = opts,
	},
}
