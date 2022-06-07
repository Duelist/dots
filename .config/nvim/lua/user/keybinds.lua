local map = require'user.utils'.map

-- hop.nvim
map('n', '<c-s>', '<cmd>HopChar2<cr>')
map('n', '<c-w>', '<cmd>HopWord<cr>')

-- nvim-lspconfig
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})

-- telescope.nvim
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<s-p>', '<cmd>Telescope live_grep<cr>')

-- trouble.nvim
map('n', '<c-t>', '<cmd>Trouble document_diagnostics<cr>')
