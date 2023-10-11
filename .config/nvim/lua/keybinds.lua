local cmd = vim.cmd
local keymap = vim.keymap.set

----------
-- Base --
----------
keymap('n', '<s-l>', '<cmd>bnext<cr>')
keymap('n', '<s-h>', '<cmd>bprevious<cr>')
keymap('n', '<c-h>', '<c-w>h')
keymap('n', '<c-j>', '<c-w>j')
keymap('n', '<c-k>', '<c-w>k')
keymap('n', '<c-l>', '<c-w>l')
keymap('i', '<c-c>', '<c-[>')

keymap('n', '<leader>q', '<cmd>bd!<cr>')

keymap('n', ';', ':')
keymap('x', ';', ':')

-- Move between windows
keymap('t', '<c-h>', [[<c-\><c-n><c-w>h]])
keymap('t', '<c-j>', [[<c-\><c-n><c-w>j]])
keymap('t', '<c-k>', [[<c-\><c-n><c-w>k]])
keymap('t', '<c-l>', [[<c-\><c-n><c-w>l]])

-- Replace all instances of word under cursor
keymap('n', '<leader>r', '<cmd>%s/\\<<c-r><c-w>\\>/<c-r><c-w>/gI<left><left><left>')

-- Terminal
keymap('n', '<s-t>', '<cmd>belowright vsp<bar>te<cr><c-\\><c-n>80<c-w><bar>i')

--------
-- AI --
--------
keymap('n', '<leader>agg', cmd.NeoAI, { desc = 'NeoAI' })
keymap('x', '<leader>agg', cmd.NeoAIContext, { desc = 'NeoAI Context' })
keymap('x', '<leader>agc', cmd.NeoAIInjectCode, { desc = 'NeoAI Inject Code' })
keymap('n', '<leader>acp', '<cmd>Copilot panel<cr>', { desc = 'Copilot Panel' })
keymap('n', '<leader>acs', '<cmd>Copilot suggestion<cr>', { desc = 'Copilot Suggestion' })

---------
-- dap --
---------
keymap('n', '<leader>dd', '<cmd>lua require"dapui".toggle()<cr>')
keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<cr>')
keymap('n', '<leader>do', '<cmd>lua require"dap".step_over()<cr>')
keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>')
keymap('n', '<leader>du', '<cmd>lua require"dap".step_out()<cr>')

------------------
-- fugitive.vim --
------------------
keymap('n', '<leader>gb', '<cmd>G blame<cr>')
keymap('n', '<leader>gB', '<cmd>GBrowse<cr>')
keymap('n', '<leader>gd', '<cmd>Gvdiffsplit<cr>')
keymap('n', '<leader>gl', '<cmd>G log --oneline<cr>')
keymap('n', '<leader>gs', '<cmd>Git<cr>')

--------------
-- hop.nvim --
--------------
keymap('n', '<leader>s', '<cmd>HopChar2<cr>')

--------------
-- neotest --
--------------
keymap('n', '<leader>tr', '<cmd>lua require("neotest").run.run()<cr>')
keymap('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>')
keymap('n', '<leader>td', '<cmd>lua require("neotest").run.run({ strategy = "dap" })<cr>')
keymap('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<cr>')
keymap('n', '<leader>tp', '<cmd>lua require("neotest").output_panel.toggle()<cr>')

--------------------
-- nvim-lspconfig --
--------------------
keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>')
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

--------------------
-- telescope.nvim --
--------------------
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Telescope Find Files' })
keymap('n', '<leader>fw', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope Live Grep' })
keymap('n', '<leader>fg', '<cmd>Telescope git_branches<cr>', { desc = 'Telescope Git Branches' })

------------------
-- trouble.nvim --
------------------
keymap('n', '<c-t>', '<cmd>Trouble document_diagnostics<cr>')
