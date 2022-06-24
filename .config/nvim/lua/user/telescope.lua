local telescope = require'telescope'

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function(opts)
                return {'--hidden'}
            end
        },
    },
}

telescope.load_extension('fzf')
telescope.load_extension('luasnip')
