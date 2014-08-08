execute pathogen#infect()
call pathogen#helptags()
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
