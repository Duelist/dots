return {
    -- Colour schemes
    { 'folke/tokyonight.nvim', branch = 'main' },
    { 'catppuccin/nvim', as = 'catppuccin' },

    -- Utility
    {'numToStr/Comment.nvim', config = true},
    'antoinemadec/FixCursorHold.nvim',
    'github/copilot.vim',
    {'phaazon/hop.nvim', config = true},
    {
        'windwp/nvim-autopairs',
        opts = {
            disable_filetype = { 'TelescopePrompt', 'vim' },
        },
    },
    {'andythigpen/nvim-coverage', config = true},
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        config = true,
    },
    {'norcalli/nvim-colorizer.lua', config = true},
    'junegunn/vim-easy-align',
    'tpope/vim-sleuth',
    'mhinz/vim-startify',
    'tpope/vim-surround',

    -- Testing
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'haydenmeade/neotest-jest',
            'nvim-neotest/neotest-python',
            'rouge8/neotest-rust',
        },
    },

    -- Debugging
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'HiPhish/debugpy.nvim',
        },
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Mason
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    },

    -- Code highlighting & navigation
    'jose-elias-alvarez/null-ls.nvim',
    {
	'nvim-treesitter/nvim-treesitter',
        build = function()
            require("nvim-treesitter.install").update { with_sync = true }
        end,
    },
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-tree-docs',
    'windwp/nvim-ts-autotag',
    'p00f/nvim-ts-rainbow',

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
        }
    },

    -- Git
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                delay = 500,
            },
        },
    },

    -- Style
    'nvim-lualine/lualine.nvim',
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    -- Search
    'nvim-lua/popup.nvim',
    {
	'nvim-telescope/telescope.nvim',
	dependencies = {
            'nvim-lua/plenary.nvim',
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
