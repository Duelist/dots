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
Plug 'phaazon/hop.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'tpope/vim-commentary'
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

" Search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git
Plug 'tpope/vim-fugitive'

" Style
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

call plug#end()


" Requires
lua require('user.colorscheme')
lua require('user.keybinds')
lua require('user.lsp')
lua require('user.plugins')
lua require('user.style')
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


" Autocmd

" Remove trailing whitespace from buffer on write
autocmd BufWritePre * %s/\s\+$//e
" Sync syntax highlighting
autocmd BufEnter * :syntax sync fromstart


" ale
let g:ale_linters = { 'javascript': ['eslint'] }


" colorizer
lua require'colorizer'.setup()


" hop
nmap s <cmd>HopChar2<cr>


" neosnippet
let g:neosnippet#enable_completed_snippet = 1


" python-mode
let g:pymode_doc = 0


" telescope
nmap <c-P> <cmd>Telescope find_files<cr>
nmap <c-[> <cmd>Telescope live_grep<cr>


" vim-commentary
nmap <leader>/ gcc
xmap <leader>/ gc


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


" vim-plug
nnoremap <leader>u :PlugUpdate<CR>


" vim-startify
let g:startify_custom_header = [
    \ '    ____             ___      __ ',
    \ '   / __ \__  _____  / (_)____/ /_',
    \ '  / / / / / / / _ \/ / / ___/ __/',
    \ ' / /_/ / /_/ /  __/ / (__  ) /_  ',
    \ '/_____/\__,_/\___/_/_/____/\__/  ',
    \ ]


" vim-test
let test#python#runner = 'pytest'
let test#python#pytest#executable = 'bin/manage test'
let test#python#pytest#file_pattern = '.*'
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<<CR>
