require'colorizer'.setup {}
require'Comment'.setup {}
require'coverage'.setup {}
require'gitsigns'.setup {
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 500,
    },
}
require'hop'.setup {}
require'trouble'.setup {}
require'lint'.linters_by_ft = {
    python = {'mypy',}
}
require'nvim-autopairs'.setup {
    disable_filetype = { 'TelescopePrompt', 'vim' },
}

-- copilot
vim.g.copilot_no_tab_map = true

-- luasnip
local luasnip = require'luasnip'
luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}


-- neotest
require'neotest'.setup {
    adapters = {
        require'neotest-jest',
        require'neotest-python' {
            dap = { justMyCode = false },
        },
        require'neotest-rust',
        require'neotest-vim-test' {
            ignore_filetypes = { "lua", "python", "vim" },
        },
    },
    status = { enabled = false },
}


-- telescope
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
