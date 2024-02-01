local mapkey = require("util.keymapper").mapvimkey
local on_attach = require("util.lsp").on_attach
local config = function()
	local rt = require("rust-tools")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	rt.setup({
		server = {
			on_attach = on_attach,
			capabilities = capabilities,
		},
	})
end
local dependencies = {
	"neovim/nvim-lspconfig",
	"nvim-lua/plenary.nvim",
	"mfussenegger/nvim-dap",
}

return {
	"simrat39/rust-tools.nvim",
	enabled = true,
	ft = "rust",
	dependencies = dependencies,
	config = config,
}
