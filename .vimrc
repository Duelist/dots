" Plugins

call plug#begin()

" Color schemes
Plug 'trusktr/seti.vim'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'

" Utility
Plug 'mhinz/vim-startify'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'janko-m/vim-test'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/vim-github-dashboard'

" Language-specific
Plug 'klen/python-mode'
Plug 'heavenshell/vim-jsdoc'

" Syntax-highlighting
Plug 'scrooloose/syntastic'
Plug 'JuliaLang/julia-vim'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'

" Vimscript
Plug 'junegunn/vader.vim'

call plug#end()

set colorcolumn=80
set completeopt=menu
set cursorline
set encoding=utf-8
set expandtab
set ignorecase
set noswapfile
set nowrap
set number
set relativenumber
set shiftwidth=2
set softtabstop=2

colorscheme seoul256

let mapleader=','

map <C-n> :NERDTreeToggle<CR>

nmap <space> <leader>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

noremap K :Ag '\b<C-R><C-W>\b'<CR>:cw<CR>

nnoremap ; :

" OS-specific

if has('gui_running')
  set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h16
  set guioptions=
endif

" Executable-specific

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" fzf.vim

nmap <c-P> :FZF<CR>

" vim-emoji

set completefunc=emoji#complete

" vim-test

nmap <leader>t :TestNearest<CR>
nmap <leader>T :TestFile<<CR>

" python-mode

let g:pymode_doc = 0

" vim-jsx

let g:jsx_ext_required = 0

" vim-jsdoc

let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_input_description = 1

" vim-airline

set laststatus=2
let g:airline_theme = 'zenburn'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#fnamemod = ':t'
