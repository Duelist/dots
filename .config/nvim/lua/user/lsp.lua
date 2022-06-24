require'nvim-lsp-installer'.setup {
    automatic_installation = true
}

require'lspconfig'.eslint.setup {}
require'lspconfig'.tsserver.setup {}
require'lspconfig'.pyright.setup {}

local cmp = require'cmp'
local lspkind = require'lspkind'
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({ mode = 'symbol_text' })
        -- format = function(entry, vim_item)
        --     vim_item.menu = ({
        --         nvim_lsp = "[LSP]",
        --         buffer = "[Buffer]",
        --         path = "[Path]",
        --     })[entry.source.name]
        --     return vim_item
        -- end,
    },
    mapping = {
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-e>'] = cmp.mapping.close(),
        ['<c-space>'] = cmp.mapping.complete(),
        ['<tab>'] = cmp.mapping(function (fallback)
            local luasnip = require'luasnip'
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<s-tab>'] = cmp.mapping(function (fallback)
            local luasnip = require'luasnip'
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i', 's'}),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
