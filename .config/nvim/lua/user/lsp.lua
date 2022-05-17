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
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
