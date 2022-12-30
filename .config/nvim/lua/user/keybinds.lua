local map = require'user.utils'.map

----------
-- Base --
----------
map('n', '<s-l>', '<cmd>bnext<cr>')
map('n', '<s-h>', '<cmd>bprevious<cr>')
map('n', '<c-h>', '<c-w>h', { noremap = true })
map('n', '<c-j>', '<c-w>j', { noremap = true })
map('n', '<c-k>', '<c-w>k', { noremap = true })
map('n', '<c-l>', '<c-w>l', { noremap = true })
map('i', '<c-c>', '<c-[>', { noremap = true })

map('n', '<leader>q', '<cmd>bp <BAR> bd #<cr>')

map('n', ';', ':', { noremap = true })
map('x', ';', ':', { noremap = true })

-- Move between windows
map('t', '<c-h>', [[<c-\><c-n><c-w>h]], { noremap = true })
map('t', '<c-j>', [[<c-\><c-n><c-w>j]], { noremap = true })
map('t', '<c-k>', [[<c-\><c-n><c-w>k]], { noremap = true })
map('t', '<c-l>', [[<c-\><c-n><c-w>l]], { noremap = true })

map('n', '<leader>s', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>', { noremap = true })

-------------
-- Copilot --
-------------
map('i', '<c-j>', 'copilot#Accept("<cr>")', { silent = true, expr = true })

---------
-- dap --
---------
map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>')
map('n', '<leader>do', '<cmd>lua require"dap".step_over()<cr>')
map('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>')
map('n', '<leader>du', '<cmd>lua require"dap".step_out()<cr>')

--------------
-- hop.nvim --
--------------
-- map('n', '<c-s>', '<cmd>HopChar2<cr>')

--------------
-- neotest --
--------------
map('n', '<leader>tr', '<cmd>lua require("neotest").run.run()<cr>', { noremap = true })
map('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', { noremap = true })
map('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<cr>')
map('n', '<leader>tp', '<cmd>lua require("neotest").output_panel.toggle()<cr>')

--------------------
-- nvim-lspconfig --
--------------------
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
map('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>', {})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})

--------------------
-- telescope.nvim --
--------------------
map('n', '<c-p>', '<cmd>Telescope find_files<cr>')
map('n', '<s-p>', '<cmd>Telescope live_grep<cr>')

------------------
-- trouble.nvim --
------------------
map('n', '<c-t>', '<cmd>Trouble document_diagnostics<cr>')
