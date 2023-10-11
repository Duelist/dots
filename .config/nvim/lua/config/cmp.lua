local cmp = require'cmp'
cmp.setup {
    formatting = {
        format = require'lspkind'.cmp_format({ mode = 'symbol_text' }),
    },
    mapping = {
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-e>'] = cmp.mapping.close(),
        ['<c-space>'] = cmp.mapping.complete(),
        ['<c-j>'] = cmp.mapping(function (fallback)
            local luasnip = require'luasnip'
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<c-k>'] = cmp.mapping(function (fallback)
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
        { name = 'copilot' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
