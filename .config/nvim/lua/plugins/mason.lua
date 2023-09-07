require("mason").setup({
	dependencies = { {"williamboman/mason-lspconfig.nvim"} },
	providers = {
		"mason.providers.registry-api", -- default
		"mason.providers.client",
	},
	ui = {
		height = 0.85,
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"svelte",
		"lua_ls",
		"graphql",
		"emmet_ls",
		"prismals",
		"pyright",
		"volar",
		"rust_analyzer",
		"clangd",
	},
	automatic_installation = true,
})
