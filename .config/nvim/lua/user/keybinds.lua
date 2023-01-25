local map = require'user.utils'.map

----------
-- Base --
----------
map('n', '<s-l>', '<cmd>bnext<cr>')
map('n', '<s-h>', '<cmd>bprevious<cr>')
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')
map('i', '<c-c>', '<c-[>')

map('n', '<leader>q', '<cmd>bd!<cr>')

map('n', ';', ':')
map('x', ';', ':')

-- Move between windows
map('t', '<c-h>', [[<c-\><c-n><c-w>h]])
map('t', '<c-j>', [[<c-\><c-n><c-w>j]])
map('t', '<c-k>', [[<c-\><c-n><c-w>k]])
map('t', '<c-l>', [[<c-\><c-n><c-w>l]])

-- Replace all instances of word under cursor
map('n', '<leader>r', ':%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>')

-- Terminal
map('n', '<s-t>', '<cmd>belowright vsp<bar>te<cr><c-\\><c-n>80<c-w><bar>i')


-------------
-- Copilot --
-------------
map('i', '<c-j>', 'copilot#Accept("<cr>")', { expr = true })

---------
-- dap --
---------
map('n', '<leader>dd', '<cmd>lua require"dapui".toggle()<cr>')
map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>')
map('n', '<leader>do', '<cmd>lua require"dap".step_over()<cr>')
map('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>')
map('n', '<leader>du', '<cmd>lua require"dap".step_out()<cr>')

------------------
-- fugitive.vim --
------------------
map('n', '<leader>gb', '<cmd>G blame<cr>', {})
map('n', '<leader>gB', '<cmd>GBrowse<cr>', {})
map('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>', {})
map('n', '<leader>gl', '<cmd>G log --oneline<cr>', {})
map('n', '<leader>gs', '<cmd>Git<cr>', {})

--------------
-- hop.nvim --
--------------
map('n', '<leader>s', '<cmd>HopChar2<cr>')

--------------
-- neotest --
--------------
map('n', '<leader>tr', '<cmd>lua require("neotest").run.run()<cr>')
map('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
map('n', '<leader>td', '<cmd>lua require("neotest").run.run({ strategy = "dap" })<cr>')
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
