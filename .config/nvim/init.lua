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

-- Set spaces
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Set line numbers & relative numbering
vim.wo.number = true
vim.wo.relativenumber = true

-- Disallow line-wrapping
vim.wo.wrap = false

-- Disable highlighting of all search terms
vim.o.hlsearch = false

-- Completion options
vim.o.completeopt = 'menuone,noselect'

-- Disable mouse
vim.o.mouse = nil

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

-- Set updatetime
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Leader keymap
vim.keymap.set('n', ';', ':')
vim.keymap.set('x', ';', ':')

-- Requires
if not vim.g.vscode then
    require('lazy').setup('plugins')
    require 'plugins'
    require 'keybinds'
end

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
