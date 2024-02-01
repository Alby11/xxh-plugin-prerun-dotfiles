-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end
Telescope = telescope

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	-- configure custom mappings
	defaults = {
		color_devicons = true,
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
			},
		},
		theme = Colorscheme,
	},
	extensions = {
		find_hidden = {
			hidden_files = true, -- default: false
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--smart-case", "--ignore", "--follow", "--hidden", "--files" },
		},
	},
})

telescope.load_extension("fzf")

local plugin_name = "telescope"

if not CheckPlugin(plugin_name) then
	return
end

Map("n", "<leader>t/", "<cmd>lua require('telescope.builtin').search_history()<cr>", Opts)
Map("n", "<leader>tB", "<cmd>lua require('telescope.builtin').builtin()<cr>", Opts)
Map("n", "<leader>tC", "<cmd>lua require('telescope.builtin').commands()<cr>", Opts)
Map("n", "<leader>tT", "<cmd>lua require('telescope.builtin').treesitter()<cr>", Opts)
Map("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", Opts)
Map("n", "<leader>tc", "<cmd>lua require('telescope.builtin').command_history()<cr>", Opts)
Map("n", "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", Opts)
Map("n", "<leader>tk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", Opts)
Map("n", "<leader>tl", "<cmd>lua require('telescope.builtin').live_grep()<cr>", Opts)
Map("n", "<leader>tm", "<cmd>lua require('telescope.builtin').marks()<cr>", Opts)
Map("n", "<leader>to", ":Telescope oldfiles<cr>", Opts)
Map("n", "<leader>tq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", Opts)
Map("n", "<leader>tr", "<cmd>lua require('telescope.builtin').registers()<cr>", Opts)
Map("n", "<leader>tt", "<cmd>lua require('telescope.builtin').tags()<cr>", Opts)
-- Git
Map("n", "<leader>tgC", "<cmd>lua require('telescope.builtin').git_commits()<cr>", Opts)
Map("n", "<leader>tgc", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", Opts)
Map("n", "<leader>tgs", "<cmd>lua require('telescope.builtin').git_status()<cr>", Opts)
Map("n", "<leader>tgt", "<cmd>lua require('telescope.builtin').git_stash()<cr>", Opts)
Map("n", "<leader>tgb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", Opts)
-- file browser
telescope.load_extension("file_browser")
Map("n", "<leader>tF", ":Telescope file_browser<cr>", Opts)

-- -- ripgrep
O.grepprg = "rg --smart-case --ignore --follow --hidden"

--
-- local telescope = require(plugin_name)
--
-- telescope.setup({
-- 	defaults = {
-- 		theme = Colorscheme,
-- 		file_sorter = require("telescope.sorters").get_fzy_sorter,
-- 		color_devicons = true,
-- 		dynamic_preview_title = true,
-- 		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
-- 		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
-- 		qlist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
-- 		prompt_prefix = " ",
-- 		selection_caret = " ",
-- 		path_display = { "smart" },
-- 	},
-- 	extensions = {
-- 		fzf = {
-- 			fuzzy = true, -- false will only do exact matching
-- 			override_generic_sorter = true, -- override the generic sorter
-- 			override_file_sorter = true, -- override the file sorter
-- 			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
-- 		}, -- the default case_mode is "smart_case"
-- 		find_hidden = {
-- 			hidden_files = true, -- default: false
-- 		},
-- 	},
-- 	pickers = {
-- 		find_files = {
-- 			find_command = { "rg", "--smart-case", "--ignore", "--follow", "--hidden", "--files" },
-- 		},
-- 	},
-- })
--
-- -- you need to call load_extension, somewhere after setup function:
-- telescope.load_extension("fzf")
--
-- Map("n", "<leader>tf", "<cmd>lua require('telescope.builtin').find_files()<cr>", Opts)
-- Map("n", "<leader>to", ":Telescope oldfiles<cr>", Opts)
-- Map("n", "<leader>tb", "<cmd>lua require('telescope.builtin').buffers()<cr>", Opts)
-- Map("n", "<leader>tB", "<cmd>lua require('telescope.builtin').builtin()<cr>", Opts)
-- Map("n", "<leader>tt", "<cmd>lua require('telescope.builtin').tags()<cr>", Opts)
-- Map("n", "<leader>tT", "<cmd>lua require('telescope.builtin').treesitter()<cr>", Opts)
-- Map("n", "<leader>tgC", "<cmd>lua require('telescope.builtin').git_commits()<cr>", Opts)
-- Map("n", "<leader>tgc", "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", Opts)
-- Map("n", "<leader>tg", "<cmd>lua require('telescope.builtin').git_status()<cr>", Opts)
-- Map("n", "<leader>tgs", "<cmd>lua require('telescope.builtin').git_stash()<cr>", Opts)
-- Map("n", "<leader>tgb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", Opts)
-- Map("n", "<leader>tC", "<cmd>lua require('telescope.builtin').commands()<cr>", Opts)
-- Map("n", "<leader>tc", "<cmd>lua require('telescope.builtin').command_history()<cr>", Opts)
-- Map("n", "<leader>t/", "<cmd>lua require('telescope.builtin').search_history()<cr>", Opts)
-- Map("n", "<leader>tk", "<cmd>lua require('telescope.builtin').keyMaps()<cr>", Opts)
-- Map("n", "<leader>tH", "<cmd>lua require('telescope.builtin').help_tags()<cr>", Opts)
-- Map("n", "<leader>tq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", Opts)
-- Map("n", "<leader>tr", "<cmd>lua require('telescope.builtin').registers()<cr>", Opts)
-- Map("n", "<leader>tm", "<cmd>lua require('telescope.builtin').marks()<cr>", Opts)
-- Map("n", "<leader>tl", "<cmd>lua require('telescope.builtin').live_grep()<cr>", Opts)
--
-- telescope.load_extension("file_browser")
-- Map("n", "<leader>tF", ":Telescope file_browser<cr>", Opts)
telescope.load_extension("repo")
Map("n", "<leader>tp", ":Telescope repo list<cr>", Opts)
Map("n", "<leader>t.p", ":Telescope repo cached_list<cr>", Opts)
--
-- -- zoxide
-- --
-- -- local z_utils = require("telescope._extensions.zoxide.utils")
-- --
-- -- require("telescope._extensions.zoxide.config").setup({
-- --   prompt_title = "[ Zoxide List ]",
-- --
-- --   -- Zoxide list command with score
-- --   list_command = "zoxide query -ls",
-- --   mappings = {
-- --     default = {
-- --       action = function(selection)
-- --         vim.cmd("cd " .. selection.path)
-- --       end,
-- --       after_action = function(selection)
-- --         print("Directory changed to " .. selection.path)
-- --       end
-- --     },
-- --     ["<C-s>"] = { action = z_utils.create_basic_command("split") },
-- --     ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
-- --     ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
-- --     ["<C-b>"] = {
-- --       keepinsert = true,
-- --       action = function(selection)
-- --         builtin.file_browser({ cwd = selection.path })
-- --       end
-- --     },
-- --     ["<C-f>"] = {
-- --       keepinsert = true,
-- --       action = function(selection)
-- --         builtin.find_files({ cwd = selection.path })
-- --       end
-- --     }
-- --   }
-- -- })
-- --
-- -- vim.keymap.set({ "n" }, "<leader>tz", ":Telescope zoxide list<cr>", { noremap = true, silent = true })
