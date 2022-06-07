require'Comment'.setup {}
require'coverage'.setup {}
require'hop'.setup {}
require'trouble'.setup {}
require'lint'.linters_bt_ft = {
    python = {'mypy',}
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
