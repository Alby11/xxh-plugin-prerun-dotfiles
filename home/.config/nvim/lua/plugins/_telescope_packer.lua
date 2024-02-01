require("telescope").load_extension("packer")

Telescope.setup({
	extensions = {
		packer = {
			theme = Colorscheme,
			layout_config = {
				height = 0.5,
			},
		},
	},
})

Map("n", "<leader>t.k", "<cmd>lua require('telescope').extensions.packer.packer(opts)<cr>", Opts)
