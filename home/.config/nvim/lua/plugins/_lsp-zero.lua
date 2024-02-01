local plugin_name = "lsp-zero"
if not CheckPlugin(plugin_name) then
	return
end

Opt.signcolumn = "yes" -- Reserve space for diagnostic icons

local lsp = require(plugin_name)

lsp.preset("recommended")

-- lsp.ensure_installed({
-- 	"ansiblels",
-- 	"bashls",
-- 	"cssls",
-- 	"dockerls",
-- 	"eslint",
-- 	"gopls",
-- 	"html",
-- 	"java",
-- 	"jsonls",
-- 	"lua_ls",
-- 	"marksman",
-- 	"pyright",
-- 	"sqlls",
-- 	"tsserver",
-- 	"vimls",
-- 	"yamlls",
-- })
-- share options between serveral servers
local lsp_opts = {
	flags = {
		debounce_text_changes = 150,
	},
}

lsp.setup_servers({
	"ansiblels",
	"bashls",
	"cssls",
	"dockerls",
	"eslint",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"sqlls",
	"tsserver",
	"vimls",
	"yamlls",
	opts = lsp_opts,
})

-- Next you call that function when the LSP server is attached to a buffer.
lsp.on_attach(function(client, bufnr)
	print("LspAttached")
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.nvim_workspace()

lsp.setup()

Vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = false,
	float = true,
})

lsp.extend_cmp()
