local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Colour schemes
    use { 'folke/tokyonight.nvim', branch = 'main' }
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- Utility
    use 'numToStr/Comment.nvim'
    use 'antoinemadec/FixCursorHold.nvim'
    use 'github/copilot.vim'
    use 'phaazon/hop.nvim'
    use 'windwp/nvim-autopairs'
    use 'andythigpen/nvim-coverage'
    use 'mfussenegger/nvim-lint'
    use 'folke/trouble.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'junegunn/vim-easy-align'
    use 'tpope/vim-sleuth'
    use 'mhinz/vim-startify'
    use 'tpope/vim-surround'

    -- Testing
    use {
        'nvim-neotest/neotest',
        requires = {
            'nvim-lua/plenary.nvim',
            'haydenmeade/neotest-jest',
            'nvim-neotest/neotest-python',
            'rouge8/neotest-rust',
        }
    }

    -- Debugging
    use {
        'microsoft/vscode-js-debug',
        opt = true,
        run = 'npm install --legacy-peer-deps && npm run compile',
    }
    use {
        'mfussenegger/nvim-dap',
        requires = {
            'rcarriga/nvim-dap-ui',
            'HiPhish/debugpy.nvim',
            'mxsdev/nvim-dap-vscode-js',
        },
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            -- Mason
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    }

    -- Code highlighting & navigation
    use 'jose-elias-alvarez/null-ls.nvim'
    use {
	'nvim-treesitter/nvim-treesitter',
        run = function()
            require("nvim-treesitter.install").update { with_sync = true }
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        after = 'nvim-treesitter',
    }
    use {
        'nvim-treesitter/nvim-tree-docs',
        after = 'nvim-treesitter',
    }
    use {
        'windwp/nvim-ts-autotag',
        after = 'nvim-treesitter',
    }
    use {
        'p00f/nvim-ts-rainbow',
        after = 'nvim-treesitter',
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
            'L3MON4D3/LuaSnip',
        }
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    -- Style
    use 'nvim-lualine/lualine.nvim'
    use {
        'akinsho/bufferline.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
    }

    -- Search
    use 'nvim-lua/popup.nvim'
    use {
	'nvim-telescope/telescope.nvim',
	requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-dap.nvim',
            'benfowler/telescope-luasnip.nvim',
        },
    }
    use {
	'nvim-telescope/telescope-fzf-native.nvim',
	run = 'make',
    }

    if is_bootstrap then
        require('packer').sync()
    end
end)


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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


-- Requires
require 'user.dap'
require 'user.keybinds'
require 'user.lsp'
require 'user.luasnip'
require 'user.plugins'
require 'user.style'
require 'user.treesitter'


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


-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})


-- Highlights
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'highlight Comment gui=italic cterm=italic' })
vim.api.nvim_create_autocmd('ColorScheme', { pattern = '*', command = 'highlight htmlArg gui=italic cterm=italic' })
