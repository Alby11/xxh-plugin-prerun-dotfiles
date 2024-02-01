-- import nvim-autopairs safely
local prettier_setup, prettier = pcall(require, "prettier")
if not prettier_setup then
	return
end

prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.22+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"sh",
		"sql",
		"toml",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
