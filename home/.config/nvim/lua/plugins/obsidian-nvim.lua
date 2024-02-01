local dependencies = {
	"nvim-lua/plenary.nvim",
	"hrsh7th/nvim-cmp",
	"nvim-telescope/telescope.nvim",
	"nvim-treesitter",
}

local opts = {
	workspaces = {
		{
			name = "personal",
			path = "~/vaults/personal",
		},
		{
			name = "work",
			path = "~/vaults/work",
		},
	},
}

local config = function()
	require("obsidian").setup({
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
			{
				name = "work",
				path = "~/vaults/work",
			},
		},
	})
end

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = dependencies,
	config = config,
	opts = opts,
	-- see below for full list of options 👇
}
