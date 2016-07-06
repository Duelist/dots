" Plugins

call plug#begin()

" Color schemes
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'trusktr/seti.vim'

" Utility
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-github-dashboard'

" Language-specific
Plug 'klen/python-mode'
Plug 'heavenshell/vim-jsdoc'

" Syntax
Plug 'JuliaLang/julia-vim'
Plug 'scrooloose/syntastic'
Plug 'gavocanov/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'

" Vimscript
Plug 'junegunn/vader.vim'

call plug#end()



" Standard settings

set backspace=eol,indent,start
set colorcolumn=80
set completeopt=menu
set cursorline
set expandtab
set ignorecase
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=2
set softtabstop=2

set background=dark
let base16colorspace=256
colorscheme base16-tomorrow

let mapleader=','

map <C-n> :NERDTreeToggle<CR>

nmap <space> <leader>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <Esc>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nnoremap ; :



" OS-specific

if has('mac')
  set clipboard=unnamed
endif

if has('gui_running')
  set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h14
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



" fzf.vim

nmap <c-P> :FZF<CR>

" javascript-libraries-syntax.vim

let g:used_javascript_libs = 'react,underscore'

" python-mode

let g:pymode_doc = 0

" syntastic

let g:syntastic_javascript_checkers = ['eslint']

" vim-airline

set laststatus=2

let g:airline_theme = 'zenburn'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#fnamemod = ':t'

" vim-easy-align

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <leader>= <Plug>(EasyAlign)ip-=
nmap <leader>: <Plug>(EasyAlign)ip*<Right>:

" vim-easymotion

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f2)

" vim-emoji

set completefunc=emoji#complete

" vim-jsdoc

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1

" vim-jsx

let g:jsx_ext_required = 0

" vim-plug

nnoremap <leader>u :PlugUpdate<CR>

" vim-test

nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<<CR>
