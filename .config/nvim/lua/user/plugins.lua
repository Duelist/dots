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
