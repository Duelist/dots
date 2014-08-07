execute pathogen#infect()
call pathogen#helptags()

syntax enable
colorscheme molokai

set expandtab
set tabstop=2
set number
set nowrap
set noswapfile
set guioptions=

nnoremap ; :

" vim-airline

set laststatus=2
let g:airline_theme = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
