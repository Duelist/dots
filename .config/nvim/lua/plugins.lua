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
    {
        'Bryley/neoai.nvim',
        cmd = {
            "NeoAI",
            "NeoAIOpen",
            "NeoAIClose",
            "NeoAIToggle",
            "NeoAIContext",
            "NeoAIContextOpen",
            "NeoAIContextClose",
            "NeoAIInject",
            "NeoAIInjectCode",
            "NeoAIInjectContext",
            "NeoAIInjectContextCode",
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            models = {
                {
                    name = "openai",
                    model = "gpt-4-code-interpreter",
                    params = nil,
                },
            },
            shortcuts = {},
            ui = {
                width = 40,
            }
        }
    },
    { 'numToStr/Comment.nvim', config = true, event = 'VeryLazy' },
    {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        config = function ()
            require'copilot'.setup {
                panel = { enabled = false },
                suggestion = { enabled = false },
            }
        end,
        event = 'InsertEnter',
    },
    { 'stevearc/dressing.nvim', config = true, event = 'VeryLazy' },
    { 'phaazon/hop.nvim', config = true, event = 'VeryLazy' },
    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        event = 'VeryLazy',
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                },
            },
            messages = {
                enabled = false,
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                -- command_palette = true, -- position the cmdline and popupmenu together
                -- long_message_to_split = true, -- long messages will be sent to a split
                -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
                -- lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        },
    },
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
            {
                'zbirenbaum/copilot-cmp',
                commit = 'c2cdb3c',
                config = true,
                dependencies = 'zbirenbaum/copilot-cmp',
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
        config = function()
            require'config.telescope'
        end,
	dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-dap.nvim',
            'benfowler/telescope-luasnip.nvim',
        },
    },
}
