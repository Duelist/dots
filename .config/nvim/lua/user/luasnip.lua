local luasnip = require'luasnip'
local fmt = require'luasnip.extras.fmt'.fmt

local s = luasnip.snippet
local i = luasnip.insert_node

luasnip.add_snippets('javascript', {
    s('ds', fmt("describe('{}', () => {{\n\t{}\n}});", { i(1), i(2) })),
    s('it', fmt("it('{}', () => {{\n\t{}\n}});", { i(1), i(2) })),
})
