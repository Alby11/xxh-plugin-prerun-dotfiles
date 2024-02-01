return Packer.startup(function(use)
	-- THE plugin manager
	use("wbthomason/packer.nvim")

	-- speed up neovim startup
	use("lewis6991/impatient.nvim")

	-- lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Fancy icons
	use("kyazdani42/nvim-web-devicons")
	use("yamatsum/nvim-nonicons")

	-- Themes
	use("xiyaowong/nvim-transparent")
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = GetSetup("catppuccin"),
		-- 	cond = false,
		-- "dracula/vim",
		-- "Mofiqul/dracula.nvim",
		-- as = "dracula",
		-- config = GetSetup("dracula"),
	})

	-- man
	-- use({ "paretje/nvim-man" })
	use({
		"m00qek/baleia.nvim",
		config = GetSetup("baleia"),
	}) -- , tag = "v1.3.0" })

	-- UI plugins
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
		tag = "legacy",
	})
	use("elijahmanor/export-to-vscode.nvim")

	-- Buffer management
	use("romgrk/barbar.nvim")
	use({
		"kwkarlwang/bufresize.nvim",
		config = GetSetup("bufresize"),
	})
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	-- Movement
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
	})
	use("ethanholz/nvim-lastplace")

	-- Commenting
	use("numToStr/Comment.nvim")

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- Text objects
	use("wellle/targets.vim")

	-- Folding
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})

	-- Indentation tracking
	use("lukas-reineke/indent-blankline.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim",
			"cljoly/telescope-repo.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make",
			},
		},
	})
	-- dressing
	use({
		"stevearc/dressing.nvim",
		config = GetSetup("dressing"),
	})
	-- Legendary
	use({
		"mrjones2014/legendary.nvim",
		config = GetSetup("legendary"),
	})
	-- Path navigation
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Session management
	use("jedrzejboczar/possession.nvim")

	-- Project browsing
	use("ahmedkhalf/project.nvim")

	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- REPL
	-- use({ "hkupty/iron.nvim" })
	use({ "Vigemus/iron.nvim" })

	-- Ansible
	use("pearofducks/ansible-vim")

	-- golang dev
	-- use({
	-- 	"fatih/vim-go",
	-- 	run = ":GoInstallBinaries",
	-- })

	-- ZPL
	use("chunPanYung/vim-zpl-syntax")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("nvim-treesitter/nvim-treesitter-context")
	use({ "fladson/vim-kitty" }) -- kitty syntax highlighting

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	}) -- autoclose tags

	-- git integration
	use("tpope/vim-fugitive")
	-- use("dinhhuy258/git.nvim")
	use("lewis6991/gitsigns.nvim")
	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- Quickfix
	use("folke/trouble.nvim")

	-------
	-- misc
	-------
	use({
		"lambdalisue/suda.vim",
		cond = function()
			return not Is_win
		end,
	})

	-- better split pane management
	-- to use Kitty multiplexer support, run the post install hook
	use({
		"mrjones2014/smart-splits.nvim",
		run = "./kitty/install-kittens.bash",
		config = GetSetup("smart-splits"),
	})
	use("winston0410/cmd-parser.nvim")
	-- highlight range written in cmeline
	use("winston0410/range-highlight.nvim")
	-- Highlight colors
	use("norcalli/nvim-colorizer.lua")
	-- AnsiEsc, to avoid ansi color codes
	-- use("powerman/vim-plugin-AnsiEsc")
	-- status line
	use("nvim-lualine/lualine.nvim")

	-- toggle terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
	})

	-- nvim cheatsheet
	use({ "sudormrfbin/cheatsheet.nvim" })

	-- keymap hints
	use("folke/which-key.nvim")

	-- redirect ex output to buffer
	use("sbulav/nredir.nvim")

	-- Mason
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jay-babu/mason-null-ls.nvim")
	use("jay-babu/mason-nvim-dap.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	-- LSP and completion
	use("neovim/nvim-lspconfig")
	use("junnplus/lsp-setup.nvim")
	use("onsails/lspkind-nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-path")
	use("lukas-reineke/cmp-rg")
	use("tamago324/cmp-zsh")
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("mhartington/formatter.nvim")
	use("nvimtools/none-ls.nvim")
	use("glepnir/lspsaga.nvim")
	-- use("tzachar/cmp-tabnine")
	use("shougo/deol.nvim")
	-- Debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")

	-- LSP Zero
	use({ "VonHeikemen/lsp-zero.nvim", config = GetSetup("lsp_config") })

	if Packer_bootstrap then
		require("packer").sync()
	end
end)
