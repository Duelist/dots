require'telescope'.setup {
    defaults = {
        file_ignore_patterns = {
            '%.lock',
            '%.png',
            '%.svg',
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(opts)
                return {'--hidden'}
            end,
        },
    },
}
require'telescope'.load_extension('fzf')
require'telescope'.load_extension('luasnip')
