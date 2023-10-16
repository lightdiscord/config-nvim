local lspconfig = require("lspconfig")
local cmp = require("cmp")

cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' }
  },
  mapping = {
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
	['<up>'] = cmp.mapping.select_prev_item(),
	['<Tab>'] = cmp.mapping.select_next_item(),
	['<down>'] = cmp.mapping.select_next_item(),
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

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- lspconfig.jdtls.setup({ cmd = { "/tmp/tmp.4Yo2GDrMMx/bin/jdtls" }, capabilities = capabilities })
-- lspconfig.bashls.setup({ capabilities = capabilities })
-- lspconfig.tsserver.setup({ capabilities = capabilities })
-- lspconfig.volar.setup{
-- 	capabilities = capabilities,
-- 	  init_options = {
--     typescript = {
--       tsdk = "/home/user/.npm-global/lib/node_modules/typescript/lib"
--     }
--   }
-- }
