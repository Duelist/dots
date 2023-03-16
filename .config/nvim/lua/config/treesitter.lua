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
    autotag = { enable = true },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    tree_docs = { enable = true },
}
require'nvim-web-devicons'.setup {
    default = true,
}
