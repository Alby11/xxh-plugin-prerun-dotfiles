local plugin_name = "bufferline"
if not CheckPlugin(plugin_name) then
	return
end

-- Move to previous/next
Map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", Opts)
Map("n", "<A-.>", "<Cmd>BufferNext<CR>", Opts)
-- Re-order to previous/next
-- Map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", Opts)
-- Map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", Opts)
Map("n", "<Leader>bmp", "<Cmd>BufferMovePrevious<CR>", Opts)
Map("n", "<Leader>bmn", "<Cmd>BufferMoveNext<CR>", Opts)
-- Goto buffer in position...
-- Map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", Opts)
-- Map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", Opts)
-- Map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", Opts)
-- Map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", Opts)
-- Map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", Opts)
-- Map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", Opts)
-- Map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", Opts)
-- Map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", Opts)
-- Map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", Opts)
-- Map("n", "<A-0>", "<Cmd>BufferLast<CR>", Opts)
-- Pin/unpin buffer
Map("n", "<A-p>", "<Cmd>BufferPin<CR>", Opts)
-- Close buffer
Map("n", "<A-c>", "<Cmd>BufferClose<CR>", Opts)
Map("n", "<A-c>", "<Cmd>Bdelete<CR>", Opts)

-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
Map("n", "<Leader>bp", "<Cmd>BufferPick<CR>", Opts)
-- Sort automatically by...
Map("n", "<Leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", Opts)
Map("n", "<Leader>bd", "<Cmd>BufferOrderByDirectory<CR>", Opts)
Map("n", "<Leader>bl", "<Cmd>BufferOrderByLanguage<CR>", Opts)
Map("n", "<Leader>bn", "<Cmd>BufferOrderByWindowNumber<CR>", Opts)
Map("n", "<Leader>bc", "<Cmd>BufferClose<CR>", Opts)
Map("n", "<Leader>bC", "<Cmd>BufferClose!<CR>", Opts)
Map("n", "<Leader>bw", "<Cmd>BufferWipeout<CR>", Opts)
Map("n", "<Leader>bW", "<Cmd>BufferWipeout!<CR>", Opts)
-- GoTo buffer
function buffer_goto_prompt()
	vim.cmd("buffers")
	local buffer_num = vim.fn.input("Enter buffer number: ")
	vim.cmd("BufferGoto " .. buffer_num)
end
Map("n", "<leader>bg", ":lua buffer_goto_prompt()<CR>", Opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- Set barbar's options
vim.g.barbar_auto_setup = false -- disable auto-setup
require(plugin_name).setup({
	-- WARN: do not copy everything below into your config!
	--       It is just an example of what configuration options there are.
	--       The defaults are suitable for most people.

	-- Enable/disable animations
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = false,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- Enables/disable clickable tabs
	--  - left-click: go to buffer
	--  - middle-click: delete buffer
	clickable = true,

	-- Excludes buffers from the tabline
	exclude_ft = { "javascript" },
	exclude_name = { "package.json" },

	-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
	-- Valid options are 'left' (the default) and 'right'
	focus_on_close = "left",

	-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
	hide = { extensions = false, inactive = false },

	-- Disable highlighting alternate buffers
	highlight_alternate = false,

	-- Disable highlighting file icons in inactive buffers
	highlight_inactive_file_icons = false,

	-- Enable highlighting visible buffers
	highlight_visible = true,

	icons = {
		-- Configure the base icons on the bufferline.
		buffer_index = true,
		buffer_number = true,
		button = "",
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = true },
		},
		filetype = {
			-- Sets the icon's highlight group.
			-- If false, will use nvim-web-devicons colors
			custom_colors = false,

			-- Requires `nvim-web-devicons` if `true`
			enabled = true,
		},
		separator = { left = "▎", right = "" },

		-- Configure the icons on the bufferline when modified or pinned.
		-- Supports all the base icon options.
		modified = { button = "●" },
		pinned = { button = "車", filename = true, separator = { right = "" } },

		-- Configure the icons on the bufferline based on the visibility of a buffer.
		-- Supports all the base icon options, plus `modified` and `pinned`.
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = "×" },
		visible = { modified = { buffer_number = false } },
	},

	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = false,
	insert_at_start = false,

	-- Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- Sets the minimum padding width with which to surround each tab
	minimum_padding = 1,

	-- Sets the maximum buffer name length.
	maximum_length = 30,

	-- If set, the letters for each buffer in buffer-pick mode will be
	-- assigned based on their name. Otherwise or in case all letters are
	-- already assigned, the behavior is to assign letters in order of
	-- usability (see order below)
	semantic_letters = true,

	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		-- Use the default values: {event = 'BufWinLeave', text = nil}
		NvimTree = true,
		-- Or, specify the text used for the offset:
		undotree = { text = "undotree" },
		-- Or, specify the event which the sidebar executes when leaving:
		["neo-tree"] = { event = "BufWipeout" },
		-- Or, specify both
		Outline = { event = "BufWinLeave", text = "symbols-outline" },
	},

	-- New buffer letters are assigned in this order. This order is
	-- optimal for the qwerty keyboard layout but might need adjustment
	-- for other layouts.
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	no_name_title = nil,
})
