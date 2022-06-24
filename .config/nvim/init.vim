" Installation
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()

" Color schemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'trusktr/seti.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'Shatur/neovim-ayu'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Utility
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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'folke/trouble.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'vim-test/vim-test'

" CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'onsails/lspkind.nvim'

" Search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'}

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Git
Plug 'tpope/vim-fugitive'

" Style
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/vim-emoji'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

call plug#end()


" Requires
lua require('user.colorscheme')
lua require('user.keybinds')
lua require('user.lsp')
lua require('user.luasnip')
lua require('user.plugins')
lua require('user.style')
lua require('user.telescope')
lua require('user.treesitter')


" Standard settings
set backspace=eol,indent,start
set clipboard=unnamed
set colorcolumn=
set completeopt+=noselect
set completeopt-=preview
set expandtab
set hidden
set ignorecase
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=4
set softtabstop=4
set autoindent
set exrc
set termguicolors
set updatetime=100

filetype plugin indent on

let mapleader=','

nmap <space> <leader>
xmap <space> <leader>
nmap <S-l> :bnext<CR>
nmap <S-h> :bprevious<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

inoremap <C-c> <C-[>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nnoremap ; :
xnoremap ; :


" Enable Italics
hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic


" OS-specific
if has('gui_running')
  set guifont=OperatorMono:h14
  set guioptions=
endif


" NeoVim-specific
if has('nvim')
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
else
  set encoding=utf-8
endif


" Executable-specific
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif


" Remove trailing whitespace from buffer on write
autocmd BufWritePre * %s/\s\+$//e
" Sync syntax highlighting
autocmd BufEnter * :syntax sync fromstart


" colorizer
lua require'colorizer'.setup()


" neosnippet
let g:neosnippet#enable_completed_snippet = 1


" python-mode
let g:pymode_doc = 0


" vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <leader>= vipga=
xmap <leader>= <S-v>ga=
nmap <leader>: vi}ga*<Right>:
xmap <leader>: <S-v>ga*<Right>:
nmap <leader>f vip:EasyAlign * /from/<CR>
xmap <leader>f <S-v>:EasyAlign * /from/<CR>


" vim-emoji
set completefunc=emoji#complete


" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" vim-jsdoc
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_input_description = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_tags = { 'returns': 'return' }


" vim-jsx
let g:jsx_ext_required = 0


" vim-startify
let g:startify_custom_header = [
    \ '    ____             ___      __ ',
    \ '   / __ \__  _____  / (_)____/ /_',
    \ '  / / / / / / / _ \/ / / ___/ __/',
    \ ' / /_/ / /_/ /  __/ / (__  ) /_  ',
    \ '/_____/\__,_/\___/_/_/____/\__/  ',
    \ ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1


" vim-test
let test#strategy = 'basic'
let g:test#basic#start_normal = 1
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<<CR>
