local plugin_name = "legendary"
-- import plugin safely
local plugin_status, legendary = pcall(require, plugin_name)
if not plugin_status then
	return
end

legendary.setup({
	-- Initial keymaps to bind, can also be a function that returns the list
	keymaps = {
		{ "<leader>tLl", ":Legendary<cr>", description = "Legendary" },
		{ "<leader>tLf", ":Legendary functions<cr>", description = "Legendary search functions" },
		{ "<leader>ks", ":PackerSync<cr>", description = "PackerSync" },
		{ "<leader>ko", ":source %<cr>", description = "Source current buffer" },
	},
	-- Initial commands to bind, can also be a function that returns the list
	commands = {},
	-- Initial augroups/autocmds to bind, can also be a function that returns the list
	autocmds = {},
	-- Initial functions to bind, can also be a function that returns the list
	funcs = {},
	-- Initial item groups to bind,
	-- note that item groups can also
	-- be under keymaps, commands, autocmds, or funcs;
	-- can also be a function that returns the list
	itemgroups = {},
	-- default opts to merge with the `opts` table
	-- of each individual item
	default_opts = {
		-- for example, { silent = true, remap = false }
		keymaps = {},
		-- for example, { args = '?', bang = true }
		commands = {},
		-- for example, { buf = 0, once = true }
		autocmds = {},
	},
	-- Customize the prompt that appears on your vim.ui.select() handler
	-- Can be a string or a function that returns a string.
	select_prompt = " legendary.nvim ",
	-- Character to use to separate columns in the UI
	col_separator_char = "│",
	-- Optionally pass a custom formatter function. This function
	-- receives the item as a parameter and the mode that legendary
	-- was triggered from (e.g. `function(item, mode): string[]`)
	-- and must return a table of non-nil string values for display.
	-- It must return the same number of values for each item to work correctly.
	-- The values will be used as column values when formatted.
	-- See function `default_format(item)` in
	-- `lua/legendary/ui/format.lua` to see default implementation.
	default_item_formatter = nil,
	-- Customize icons used by the default item formatter
	icons = {
		-- keymap items list the modes in which the keymap applies
		-- by default, you can show an icon instead by setting this to
		-- a non-nil icon
		keymap = nil,
		command = "",
		fn = "󰡱",
		itemgroup = "",
	},
	-- Include builtins by default, set to false to disable
	include_builtin = true,
	-- Include the commands that legendary.nvim creates itself
	-- in the legend by default, set to false to disable
	include_legendary_cmds = true,
	-- Options for list sorting. Note that fuzzy-finders will still
	-- do their own sorting. For telescope.nvim, you can set it to use
	-- `require('telescope.sorters').fuzzy_with_index_bias({})` when
	-- triggered via `legendary.nvim`. Example config for `dressing.nvim`:
	--
	-- require('dressing').setup({
	--  select = {
	--    get_config = function(opts)
	--      if opts.kind == 'legendary.nvim' then
	--        return {
	--          telescope = {
	--            sorter = require('telescope.sorters').fuzzy_with_index_bias({})
	--          }
	--        }
	--      else
	--        return {}
	--      end
	--    end
	--  }
	-- })
	sort = {
		-- sort most recently used item to the top
		most_recent_first = true,
		-- sort user-defined items before built-in items
		user_items_first = true,
		-- sort the specified item type before other item types,
		-- value must be one of: 'keymap', 'command', 'autocmd', 'group', nil
		item_type_bias = nil,
		-- settings for frecency sorting.
		-- https://en.wikipedia.org/wiki/Frecency
		-- Set `frecency = false` to disable.
		-- this feature requires sqlite.lua (https://github.com/kkharji/sqlite.lua)
		-- and will be automatically disabled if sqlite is not available.
		-- NOTE: THIS TAKES PRECEDENCE OVER OTHER SORT OPTIONS!
		frecency = {
			-- the directory to store the database in
			db_root = string.format("%s/legendary/", vim.fn.stdpath("data")),
			-- the maximum number of timestamps for a single item
			-- to store in the database
			max_timestamps = 10,
		},
	},
	lazy_nvim = {
		-- Automatically register keymaps that are defined on lazy.nvim plugin specs
		-- using the `keys = {}` property.
		auto_register = false,
	},
	-- Which extensions to load; no extensions are loaded by default.
	-- Setting the plugin name to `false` disables loading the extension.
	-- Setting it to any other value will attempt to load the extension,
	-- and pass the value as an argument to the extension, which should
	-- be a single function. Extensions are modules under `legendary.extensions.*`
	-- which return a single function, which is responsible for loading and
	-- initializing the extension.
	extensions = {
		nvim_tree = true,
		-- smart_splits = false,
		op_nvim = false,
		diffview = true,
		which_key = {
			-- Automatically add which-key tables to legendary
			-- see ./doc/WHICH_KEY.md for more details
			auto_register = true,
			-- you can put which-key.nvim tables here,
			-- or alternatively have them auto-register,
			-- see ./doc/WHICH_KEY.md
			mappings = {
				k = {
					name = "packer", -- optional group name
					o = { "<cmd>source %<cr>", "source current file" }, -- create a binding with label
					s = { "<cmd>PackerSync<cr>", "PackerSync" }, -- additional options for creating the keymap
					t = { "<cmd>PackerStatus<cr>", "PackerStatus" }, -- additional options for creating the keymap
					i = { "<cmd>PackerInstall<cr>", "PackerInstall" }, -- additional options for creating the keymap
					l = { "<cmd>PackerClean<cr>", "PackerClean" }, -- additional options for creating the keymap
					c = { "<cmd>PackerCompile<cr>", "PackerCompile" }, -- additional options for creating the keymap
					["1"] = "which_key_ignore", -- special label to hide it in the popup
					-- b = {
					-- 	function()
					-- 		print("bar")
					-- 	end,
					-- 	"Foobar",
					-- }, -- you can also pass functions!
				},
				{ prefix = "<leader>" },
			},
			opts = {
				mode = "n", -- NORMAL mode
				-- prefix: use "<leader>f" for example for mapping everything related to finding files
				-- the prefix is prepended to every mapping part of `mappings`
				prefix = "",
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = false, -- use `nowait` when creating keymaps
				expr = false, -- use `expr` when creating keymaps
			},
			-- controls whether legendary.nvim actually binds they keymaps,
			-- or if you want to let which-key.nvim handle the bindings.
			-- if not passed, true by default
			do_binding = true,
			-- controls whether to use legendary.nvim item groups
			-- matching your which-key.nvim groups; if false, all keymaps
			-- are added at toplevel instead of in a group.
			use_groups = true,
		},
		smart_splits = {
			directions = { "h", "j", "k", "l" },
			mods = {
				move = "<C>",
				resize = "<M>",
			},
		},
	},
	scratchpad = {
		-- How to open the scratchpad buffer,
		-- 'current' for current window, 'float'
		-- for floating window
		view = "float",
		-- How to show the results of evaluated Lua code.
		-- 'print' for `print(result)`, 'float' for a floating window.
		results_view = "float",
		-- Border style for floating windows related to the scratchpad
		float_border = "rounded",
		-- Whether to restore scratchpad contents from a cache file
		keep_contents = true,
	},
	-- Directory used for caches
	cache_path = string.format("%s/legendary/", vim.fn.stdpath("cache")),
	-- Log level, one of 'trace', 'debug', 'info', 'warn', 'error', 'fatal'
	log_level = "info",
})
