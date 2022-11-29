require'colorizer'.setup{}
require'Comment'.setup {}
require'coverage'.setup {}
require'hop'.setup {}
require'trouble'.setup {}
require'lint'.linters_by_ft = {
    python = {'mypy',}
}

-- LuaSnip
local luasnip = require'luasnip'
luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}


-- Neo Test
require'neotest'.setup {
    adapters = {
        require'neotest-python' {
            dap = {justMyCode = false},
        },
        require'neotest-vim-test' {
            ignore_filetypes = {"lua", "python", "vim"},
        },
    }
}


-- Telescope
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


-- vgit
require('vgit').setup()
vim.o.updatetime = 300
-- vim.o.incsearch = false
vim.wo.signcolumn = 'yes'


-- vim-startify
vim.g.startify_custom_header = {
    [[    ____             ___      __ ]],
    [[   / __ \__  _____  / (_)____/ /_]],
    [[  / / / / / / / _ \/ / / ___/ __/]],
    [[ / /_/ / /_/ /  __/ / (__  ) /_  ]],
    [[/_____/\__,_/\___/_/_/____/\__/  ]],
}
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 1
