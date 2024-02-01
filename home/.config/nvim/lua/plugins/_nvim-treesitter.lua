local plugin_name = "nvim-treesitter"

if not CheckPlugin(plugin_name) then
	return
end
plugin_name = "nvim-treesitter.configs"
local treesitter = require(plugin_name)

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- Incremental selection based on the named nodes from the grammar.
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn", -- set to `false` to disable one of the mappings
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	-- ensure these language parsers are installed
	ensure_installed = {
		"awk",
		"bash",
		"c",
		"c_sharp",
		"cmake",
		"css",
		"devicetree",
		"diff",
		"dockerfile",
		"fish",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"go",
		"gomod",
		"gowork",
		"graphql",
		-- "help",
		"html",
		"http",
		"java",
		"javascript",
		"json",
		"json5",
		"jsonc",
		"lua",
		"make",
		"markdown",
		"perl",
		"python",
		"regex",
		"ruby",
		"rust",
		"scss",
		"sql",
		"svelte",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"yaml",
	},
	-- auto install above language parsers
	auto_install = true,
})
Cmd([[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.
]])
require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			-- 'for', -- These won't appear in the context
			-- 'while',
			-- 'if',
			-- 'switch',
			-- 'case',
		},
		-- Example for a specific filetype.
		-- If a pattern is missing, *open a PR* so everyone can benefit.
		--   rust = {
		--       'impl_item',
		--   },
	},
	exact_patterns = {
		-- Example for a specific filetype with Lua patterns
		-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
		-- exactly match "impl_item" only)
		-- rust = true,
	},

	-- [!] The options below are exposed but shouldn't require your attention,
	--     you can safely ignore them.

	zindex = 20, -- The Z-index of the context window
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
})
