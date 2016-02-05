set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'trusktr/seti.vim'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-startify'
Plugin 'janko-m/vim-test'
Plugin 'JuliaLang/julia-vim'
Plugin 'klen/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mxw/vim-jsx'
Plugin 'moll/vim-node'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'bling/vim-airline'
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on

syntax enable

set encoding=utf-8

set expandtab
set shiftwidth=2
set softtabstop=2
set ignorecase
set completeopt=menu

set number
set colorcolumn=80
set cursorline
set nowrap
set noswapfile

colorscheme molokai

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
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#fnamemod = ':t'
