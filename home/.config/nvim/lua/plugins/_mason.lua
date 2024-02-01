-- import lsp_zero plugin safely
local lsp_zero_status, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_status then
	return
end

-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- import mason-nvim-dap plugin safely
local mason_nvim_dap_status, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not mason_nvim_dap_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"ansiblels",
		"bashls",
		"cssls",
		"dockerls",
		"emmet_ls",
		"gopls",
		"html",
		"java",
		"marksman",
		"pyright",
		"lua_ls",
		"sqlls",
		"tailwindcss",
		"tsserver",
		"vimls",
		"yamlls",
		handlers = {
			lsp_zero.default_setup,
			lua_ls = function()
				local lua_opts = lsp_zero.nvim_lua_ls()
				require("lspconfig").lua_ls.setup(lua_opts)
			end,
		},
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"ansiblels", -- yanl
		"actionlint", -- yanl
		"bashls",
		"djlint",
		"dockerls",
		"eslint_d", -- ts/js linter
		"fixjson",
		"flake8",
		"gitcommit",
		"gofumpt",
		"hadolint",
		"hadolint",
		"lua_ls",
		"markdownlint",
		"prettier", -- ts/js formatter
		"shfmt",
		"sqlfluff",
		"stylua", -- lua formatter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
	automatic_setup = true,
})
-- mason_null_ls.setup_handlers({})

mason_nvim_dap.setup({
	ensure_installed = {
		"bash",
		"delve",
		"javadbg",
		"node2",
		"python",
	},
})
