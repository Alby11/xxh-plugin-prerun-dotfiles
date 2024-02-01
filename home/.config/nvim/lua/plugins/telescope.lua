local mapkey = require("util.keymapper").mapvimkey
local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})

	-- Add other extensions as needed
	telescope.load_extension("file_browser")
	telescope.load_extension("fzf")
end

-- Key mappings for Telescope
local keys = {
	mapkey("<leader>fF", "Telescope file_browser", "n"),
	mapkey("<leader>fH", "Telescope file_browser path=%:p:h select_buffer=true<CR>", "n"),
	mapkey("<leader>fb", "Telescope buffers", "n"),
	mapkey("<leader>fc", "Telescope commands", "n"),
	mapkey("<leader>ff", "Telescope find_files", "n"),
	mapkey("<leader>fg", "Telescope live_grep", "n"),
	mapkey("<leader>fh", "Telescope help_tags", "n"),
	mapkey("<leader>fk", "Telescope keymaps", "n"),
	mapkey("<leader>fo", "Telescope oldfiles", "n"),
	mapkey("<leader>fr", "Telescope repo", "n"),
	mapkey("<leader>fz", "Telescope zoxide", "n"),
}

-- Plugin configurations
return {
	-- Telescope main plugin
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = config,
		keys = keys,
	},

	-- Telescope extensions and related plugins
	{ "cljoly/telescope-repo.nvim" },
	{ "jvgrootveld/telescope-zoxide" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	-- Add other plugins as needed
}
