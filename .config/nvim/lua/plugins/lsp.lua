require("mason-lspconfig").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspsaga").setup({
	code_action_icon = "💡",
	symbol_in_winbar = {
		in_custom = false,
		enable = true,
		separator = ' ',
		show_file = true,
		file_formatter = ""
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local opts = {buffer = bufnr}

    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set({ "i", "n" }, "<C-s>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  end
})

require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
				},
			},
		},
	}
}

require("lspconfig").pyright.setup {
	capabilities = capabilities,
}

require("lspconfig").tsserver.setup {
	capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup {
	capabilities = capabilities,
}

require("lspconfig").gopls.setup {
	capabilities = capabilities,
}

require("lspconfig").clangd.setup {
	capabilities = capabilities,
}

require("lspconfig").cssls.setup {
	capabilities = capabilities,
}

require("lspconfig").volar.setup {
	capabilities = capabilities,
}

require("lspconfig").jsonls.setup {
	capabilities = capabilities,
}

require("lspconfig").tailwindcss.setup {
	capabilities = capabilities,
}

require("lspconfig").astro.setup {
	capabilities = capabilities,
}

require("lspconfig").solidity.setup {
	capabilities = capabilities,
}

require("lspconfig").prismals.setup {
	capabilities = capabilities,
}

require("lspconfig").bashls.setup {
	capabilities = capabilities,
}

require("lspconfig").html.setup {
	capabilities = capabilities,
}

require("lspconfig").emmet_ls.setup {
    capabilities = capabilities,
}
