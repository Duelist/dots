require'nvim-treesitter.configs'.setup {
    ensure_installed = {  'javascript', 'lua', 'python', 'rust', 'typescript' },
    highlight = { enable = true },
    incremental_selection = {
        enabled = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    -- Custom modules
    indent = { enable = true },
    tree_docs = { enable = true },
}
