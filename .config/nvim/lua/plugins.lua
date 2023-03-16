return {
    -- Colour schemes
    { 'folke/tokyonight.nvim', branch = 'main', lazy = false },
    { 'catppuccin/nvim', as = 'catppuccin', lazy = false },

    -- Utility
    {'numToStr/Comment.nvim', config = true, event = 'VeryLazy'},
    {'github/copilot.vim', cmd = 'Copilot'},
    {'phaazon/hop.nvim', config = true, event = 'VeryLazy'},
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        config = true,
    },
    {'mhinz/vim-startify', lazy = false},

    -- Testing
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'haydenmeade/neotest-jest',
            'nvim-neotest/neotest-python',
            'rouge8/neotest-rust',
        },
        event = 'VeryLazy',
    },

    -- Debugging
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'HiPhish/debugpy.nvim',
        },
        event = 'VeryLazy',
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Mason
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        event = 'BufReadPost',
    },

    -- Code highlighting & navigation
    {
	'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'VeryLazy',
    },
    {'nvim-treesitter/nvim-treesitter-context', event = 'VeryLazy'},
    {'nvim-treesitter/nvim-tree-docs', event = 'VeryLazy'},
    {'windwp/nvim-ts-autotag', event = 'VeryLazy'},
    {'p00f/nvim-ts-rainbow', event = 'VeryLazy'},

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
            'L3MON4D3/LuaSnip',
        },
        event = 'InsertEnter',
    },

    -- Git
    {'tpope/vim-fugitive', event = 'VeryLazy'},
    {'tpope/vim-rhubarb', event = 'VeryLazy'},
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 500,
            },
        },
        event = 'BufReadPost',
    },

    -- Style
    'nvim-lualine/lualine.nvim',
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        lazy = false,
    },

    -- Search
    {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-dap.nvim',
            'benfowler/telescope-luasnip.nvim',
        },
        opts = {
            pickers = {
                find_files = {
                    hidden = true,
                },
                live_grep = {
                    additional_args = function(opts)
                        return {'--hidden'}
                    end
                },
            },
        },
    },
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
}
