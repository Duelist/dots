local map = require'user.utils'.map

-- Base
map('n', '<s-l>', '<cmd>bnext<cr>')
map('n', '<s-h>', '<cmd>bprevious<cr>')
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })
map('i', '<c-c>', '<c-[>', { noremap = true })

map('n', '<leader>q', '<cmd>bp <BAR> bd #<cr>')
map('n', '<leader>bl', '<cmd>ls<cr>')

map('n', ';', ':', { noremap = true })
map('x', ';', ':', { noremap = true })

map('t', '<c-h>', [[<c-\><c-n><c-w>h]], { noremap = true })
map('t', '<c-j>', [[<c-\><c-n><c-w>j]], { noremap = true })
map('t', '<c-k>', [[<c-\><c-n><c-w>k]], { noremap = true })
map('t', '<c-l>', [[<c-\><c-n><c-w>l]], { noremap = true })

-- hop.nvim
map('n', '<c-s>', '<cmd>HopChar2<cr>')

-- nvim-lspconfig
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})

-- telescope.nvim
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<s-p>', '<cmd>Telescope live_grep<cr>')

-- trouble.nvim
map('n', '<c-t>', '<cmd>Trouble document_diagnostics<cr>')

-- vim-easy-align
map('n', 'ga', '<Plug>(EasyAlign)')
map('x', 'ga', '<Plug>(EasyAlign)')

map('n', '<leader>=', 'vipga=')
map('x', '<leader>=', '<s-v>ga=')
map('n', '<leader>:', 'vi}ga*<right>:')
map('x', '<leader>:', '<s-v>ga*<right>:')
map('n', '<leader>f', 'vip:EasyAlign * /from/<cr>')
map('x', '<leader>f', '<s-v>:EasyAlign * /from/<cr>')

-- vim-test
map('n', '<leader>t', '<cmd>TestNearest<cr>', { noremap = true })
map('n', '<leader>T', '<cmd>TestFile<cr>', { noremap = true })
