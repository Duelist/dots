return {
    -- Colour schemes
    { 'folke/tokyonight.nvim', branch = 'main' },
    {
        'catppuccin/nvim',
        config = function()
            -- Set colorscheme
            vim.o.termguicolors = true
            vim.g.catppuccin_flavour = 'mocha'
            vim.cmd.colorscheme('catppuccin')
        end,
        name = 'catppuccin',
    },

    -- Utility
    { 'numToStr/Comment.nvim', config = true, event = 'VeryLazy' },
    { 'github/copilot.vim', event = 'VeryLazy' },
    { 'phaazon/hop.nvim', config = true, event = 'VeryLazy' },
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        config = true,
    },
    {
        'mhinz/vim-startify',
        config = function()
            vim.g.startify_custom_header = {
                [[    ____             ___      __ ]],
                [[   / __ \__  _____  / (_)____/ /_]],
                [[  / / / / / / / _ \/ / / ___/ __/]],
                [[ / /_/ / /_/ /  __/ / (__  ) /_  ]],
                [[/_____/\__,_/\___/_/_/____/\__/  ]],
            }
            vim.g.startify_change_to_dir = 0
            vim.g.startify_change_to_vcs_root = 1
        end,
    },

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
        config = function()
            require 'config.dap'
        end,
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'HiPhish/debugpy.nvim',
        },
        event = 'VeryLazy',
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        config = function()
            require'config.lspconfig'
        end,
        dependencies = {
            -- Mason
            {
                'williamboman/mason.nvim',
                config = true,
                dependencies = {
                    {
                        'williamboman/mason-lspconfig.nvim',
                        config = true,
                    },
                },
            },
        },
    },

    -- Code highlighting & navigation
    {
	'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require'config.treesitter'
        end,
    },
    {'nvim-treesitter/nvim-treesitter-context'},
    {'nvim-treesitter/nvim-tree-docs'},
    {'windwp/nvim-ts-autotag', config = true},

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require 'config.cmp'
        end,
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind.nvim',
            {
                'L3MON4D3/LuaSnip',
                config = function()
                    require'config.luasnip'
                end,
            },
        },
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
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require'config.lualine'
        end,
    },
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require'nvim-web-devicons'.setup {
                default = true,
            }
        end
    },
    {
        'akinsho/bufferline.nvim',
        config = true,
        dependencies = 'nvim-tree/nvim-web-devicons',
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
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
	cmd = 'Telescope',
    },
}
