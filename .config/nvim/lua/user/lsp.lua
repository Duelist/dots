require'nvim-lsp-installer'.setup {
    automatic_installation = true
}

require'lspconfig'.eslint.setup {}
require'lspconfig'.tsserver.setup {}
require'lspconfig'.pyright.setup {}

local cmp = require'cmp'
cmp.setup {
    formatting = {
        format = function(entry, vim_item)
        vim_item.menu = ({
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            path = "[Path]",
        })[entry.source.name]
        return vim_item
        end,
    },
    mapping = {
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-e>'] = cmp.mapping.close(),
        ['<c-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<c-space>'] = cmp.mapping.complete(),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
