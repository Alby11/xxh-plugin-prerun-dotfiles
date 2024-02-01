return Packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")

	use("elijahmanor/export-to-vscode.nvim")

	-- Movement
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})

	-- Commenting
	use("numToStr/Comment.nvim")

	-- Wrapping/delimiters
	use("tpope/vim-surround")

	-- Text objects
	use("wellle/targets.vim")
end)
