require'colorizer'.setup{}
require'Comment'.setup {}
require'coverage'.setup {}
require'hop'.setup {}
require'trouble'.setup {}
require'lint'.linters_by_ft = {
    python = {'mypy',}
}

local luasnip = require'luasnip'
luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
}

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

vim.g.startify_custom_header = {
    [[    ____             ___      __ ]],
    [[   / __ \__  _____  / (_)____/ /_]],
    [[  / / / / / / / _ \/ / / ___/ __/]],
    [[ / /_/ / /_/ /  __/ / (__  ) /_  ]],
    [[/_____/\__,_/\___/_/_/____/\__/  ]],
}
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 1
