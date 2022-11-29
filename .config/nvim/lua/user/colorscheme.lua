-- Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- catppuccin
vim.g.catppuccin_flavour = 'mocha'
require'catppuccin'.setup()

-- Load the colorscheme
-- vim.cmd[[colorscheme tokyonight]]
vim.cmd[[colorscheme catppuccin]]
