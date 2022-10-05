local status, mason = pcall(require, "mason")
if not status then
	print("mason is not installed")
	return
end

local status2, masonLspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	print("mason-lspconfig is not installed")
	return
end

mason.setup({})

masonLspconfig.setup({
	ensure_installed = {
		"jsonls",
		"stylua",
		"lua-language-server",
		"tsserver",
		"pyright",
		"yamlls",
		"bashls",
		"csharp-language-server",
		"csharpier",
		-- "omnisharp",
		"rust_analyzer",
		"clangd",
	},
})
