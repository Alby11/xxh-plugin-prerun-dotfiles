-- import nvim-autopairs safely
-- local fugitive_setup, fugitive = pcall(require, "fugitive")
-- if not fugitive_setup then
-- 	return
-- end
--
Map("n", "<leader>gst", "<cmd>Git status<cr>", Opts)
Map("n", "<leader>gau", "<cmd>Git add -u --verbose<cr>", Opts)
Map("n", "<leader>gw", "<cmd>Gwrite<cr>", Opts)
Map("n", "<leader>gc", "<cmd>Git commit --verbose<cr>", Opts)
Map("n", "<leader>gp", "<cmd>Git push --verbose<cr>", Opts)
Map("n", "<leader>gL", "<cmd>Git pull --verbose<cr>", Opts)
Map("n", "<leader>gd", "<cmd>Git diff<cr>", Opts)
Map("n", "<leader>gds", "<cmd>Gvdiffsplit<cr>", Opts)
Map("n", "<leader>gl", "<cmd>Git log<cr>", Opts)
Map("n", "<leader>gb", "<cmd>GBrowse<cr>", Opts)
