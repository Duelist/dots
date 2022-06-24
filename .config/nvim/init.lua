local Plug = vim.fn['plug#']

-- Plugins
vim.call('plug#begin')

-- Color schemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'trusktr/seti.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'Shatur/neovim-ayu'
Plug('folke/tokyonight.nvim', { branch = 'main' })

-- Utility
Plug 'jiangmiao/auto-pairs'
Plug 'numToStr/Comment.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'phaazon/hop.nvim'
Plug 'rcarriga/neotest'
Plug 'rcarriga/neotest-python'
Plug 'rcarriga/neotest-vim-test'
Plug 'andythigpen/nvim-coverage'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-lint'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate'] })
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'folke/trouble.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'

-- CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind.nvim'

-- Search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'benfowler/telescope-luasnip.nvim'
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })

-- Snippets
Plug 'L3MON4D3/LuaSnip'

-- Git
Plug 'tpope/vim-fugitive'

-- Style
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

vim.call('plug#end')


-- Leader
vim.g.mapleader = ' '


-- Requires
require 'user.colorscheme'
require 'user.keybinds'
require 'user.lsp'
require 'user.luasnip'
require 'user.plugins'
require 'user.style'
require 'user.telescope'
require 'user.treesitter'


-- Standard settings
vim.cmd [[
    set autoindent
    set backspace=eol,indent,start
    set clipboard=unnamed
    set colorcolumn=
    set completeopt+=noselect
    set completeopt-=preview
    set expandtab
    set exrc
    set hidden
    set ignorecase
    set noswapfile
    set nowrap
    set number
    set relativenumber
    set shiftwidth=4
    set softtabstop=4
    set termguicolors
    set updatetime=100
]]

-- Auto commands
vim.api.nvim_command [[
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
]]

-- Highlights
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'highlight Comment gui=italic cterm=italic' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'highlight htmlArg gui=italic cterm=italic' })
