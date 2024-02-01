-- local plugin_name = "telescope-repo"

-- if not CheckPlugin(plugin_name) then
-- return
-- end

Telescope.load_extension("repo")
Map("n", "<leader>tR", ":Telescope repo list<cr>", Opts)
Map("n", "<leader>tRc", ":Telescope repo cached_list<cr>", Opts)
