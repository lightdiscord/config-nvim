vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.number = true

require("lazy").setup({
    { "ellisonleao/gruvbox.nvim" },
    { "nvim-tree/nvim-tree.lua" },
    { "nvim-tree/nvim-web-devicons" },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {
        "neovim/nvim-lspconfig"
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline"
        }
    }
})

vim.cmd.colorscheme('gruvbox')

require("nvim-tree").setup()

local nvim_tree_api = require('nvim-tree.api')

vim.keymap.set("n", "<leader>tt", nvim_tree_api.tree.toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tf", function() nvim_tree_api.tree.find_file({ open = true, focus = true }) end, { noremap = true, silent = true })

require('telescope').setup {
    defaults = {
        layout_strategy = "vertical",
    }
}

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope.find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<c-p>", telescope.find_files, { noremap = true, silent = true })

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    highlight = {
        enable = true
    }
}

local cmp = require'cmp'

cmp.setup({
    -- snippet = {
    --     -- REQUIRED - you must specify a snippet engine
    --     expand = function(args)
    --         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    --     end,
    -- },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['tsserver'].setup { capabilities = capabilities }
require('lspconfig')['svelte'].setup { capabilities = capabilities }

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    end,
})
