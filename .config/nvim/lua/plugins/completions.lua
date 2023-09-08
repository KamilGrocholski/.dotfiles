local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-u>'] = cmp.mapping.scroll_docs(4),
		['<C-space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		--order matters
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer",  keyword_length = 5 },
	}, {
		{ name = "buffer" }
	}),
})

vim.opt.pumheight = 10 -- max number of items
