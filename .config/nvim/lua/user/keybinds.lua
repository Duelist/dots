 -- trouble
vim.api.nvim_set_keymap('n', '<c-t>', '<cmd>Trouble document_diagnostics<cr>',
    {silent = true, noremap = true}
)
