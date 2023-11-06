local lspconfig = require'lspconfig'
lspconfig.eslint.setup {}
lspconfig.pyright.setup {
    filetypes = {'python'},
}
lspconfig.rust_analyzer.setup {}
lspconfig.tsserver.setup {}
