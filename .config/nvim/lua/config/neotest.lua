require'neotest'.setup {
    adapters = {
        require'neotest-jest',
        require'neotest-python' {
            dap = { justMyCode = false },
        },
        require'neotest-rust',
    },
    output = { enabled = false },
    output_panel = { enabled = false },
    quickfix = {
        open = function ()
            vim.cmd [[Trouble quickfix]]
        end,
    },
    status = { enabled = false },
}
