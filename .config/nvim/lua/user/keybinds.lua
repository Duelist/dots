local map = require'user.utils'.map

-- nvim-lspconfig
map('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
map('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

-- telescope
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<s-p>', '<cmd>Telescope live_grep<cr>')

-- trouble
map('n', '<c-t>', '<cmd>Trouble document_diagnostics<cr>')

-- vim-commentary
map('n', '<leader>/', 'gcc')
map('x', '<leader>/', 'gc')
