local luasnip = require'luasnip'
local fmt = require'luasnip.extras.fmt'.fmt

local s = luasnip.snippet
local i = luasnip.insert_node

luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}
luasnip.add_snippets('javascript', {
    -- Debugging
    s('cdb', fmt("console.debug('ian-debug: {}', {});", { i(1), i(2) })),
    s('clg', fmt("console.log('ian-log: {}', {});", { i(1), i(2) })),
    -- Testing
    s('ds', fmt("describe('{}', () => {{\n\t{}\n}});", { i(1), i(2) })),
    s('it', fmt("it('{}', () => {{\n\t{}\n}});", { i(1), i(2) })),
})
