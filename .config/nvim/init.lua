local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('plugins', {
    defaults = { lazy = true },
})

-- Set line numbers & relative numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Disallow line-wrapping
vim.wo.wrap = false

-- Disable highlighting of all search terms
vim.o.hlsearch = false

-- Completion options
vim.o.completeopt = 'menuone,noselect'

-- Use project-specfic rc files
vim.o.exrc = true

-- (Mostly) Case insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disable swap file usage
vim.o.swapfile = false

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Set colorscheme
vim.o.termguicolors = true
vim.g.catppuccin_flavour = 'mocha'
vim.cmd[[colorscheme catppuccin]]

-- Set updatetime
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- vim-startify
vim.g.startify_custom_header = {
    [[    ____             ___      __ ]],
    [[   / __ \__  _____  / (_)____/ /_]],
    [[  / / / / / / / _ \/ / / ___/ __/]],
    [[ / /_/ / /_/ /  __/ / (__  ) /_  ]],
    [[/_____/\__,_/\___/_/_/____/\__/  ]],
}
vim.g.startify_change_to_dir = 0
vim.g.startify_change_to_vcs_root = 1

-- Requires
require 'plugins'
require 'config.dap'
require 'config.keybinds'
require 'config.lsp'
require 'config.luasnip'
require 'config.style'
require 'config.treesitter'


-- Auto commands
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Remove all trailing whitespace on save.',
    group = vim.api.nvim_create_augroup('Duelist~All', { clear = true }),
    command = [[%s/\s\+$//e]],
})
local terminal_autocmd_group = vim.api.nvim_create_augroup('Duelist~Terminal', { clear = true })
vim.api.nvim_create_autocmd({'TermOpen'}, {
    desc = 'Commands to execute when entering terminal buffer.',
    group = terminal_autocmd_group,
    callback = function()
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.api.nvim_command [[startinsert]]
    end
})
vim.api.nvim_create_autocmd({'BufWinEnter', 'WinEnter'}, {
    desc = 'Commands to execute when entering terminal buffer.',
    pattern = 'term://*',
    group = terminal_autocmd_group,
    callback = function()
        vim.api.nvim_command [[startinsert]]
    end,
})
vim.api.nvim_create_autocmd({'BufLeave'}, {
    desc = 'Commands to execute when leaving a terminal buffer.',
    pattern = 'term://*',
    group = terminal_autocmd_group,
    command = [[stopinsert]],
})

-- Highlights
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'highlight Comment gui=italic cterm=italic' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'highlight htmlArg gui=italic cterm=italic' })
