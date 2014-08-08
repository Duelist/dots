set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'JuliaLang/julia-vim'
Plugin 'bling/vim-airline'

call vundle#end()

syntax enable

colorscheme molokai

set encoding=utf-8
set tabstop=2
set number
set nowrap
set noswapfile
set expandtab

let mapleader=","

nmap <space> <leader>
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
nmap <leader>bl :ls<cr>

nnoremap ; :

" vim-airline

set laststatus=2
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#fnamemod = ':t'
