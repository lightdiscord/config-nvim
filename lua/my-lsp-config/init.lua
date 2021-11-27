local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm()
  },
  completion = {
    completeopt = 'menu,menuone,noinsert,preview',
  },
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
	end
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig.clangd.setup({ capabilities = capabilities })
lspconfig.bashls.setup({ capabilities = capabilities })

require"nvim-treesitter.configs".setup {
	highlight = {
		enable = true
	}
}
