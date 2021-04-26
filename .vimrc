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

" Utility
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'sickill/vim-pasta'
Plug 'junegunn/vim-slash'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'janko-m/vim-test'

" Search
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Javascript
Plug 'heavenshell/vim-jsdoc'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'gavocanov/vim-js-indent'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Python
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Style
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-emoji'

call plug#end()


" Colorscheme settings
" set background=dark
" colorscheme snazzy

" Standard settings
set backspace=eol,indent,start
set colorcolumn=80
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


" Autocmd

" Remove trailing whitespace from buffer on write
autocmd BufWritePre * %s/\s\+$//e
" Sync syntax highlighting
autocmd BufEnter * :syntax sync fromstart


" ale
let g:ale_linters = { 'javascript': ['eslint'] }


" fzf.vim
nmap <c-P> :FZF<CR>


" neosnippet
let g:neosnippet#enable_completed_snippet = 1


" python-mode
let g:pymode_doc = 0


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


" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f2)


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


" vim-lightline
set showtabline=2
let g:lightline = {}
let g:lightline.colorscheme = 'snazzy'
let g:lightline.tabline = { 'left': [['buffers']], 'right': [['close']] }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type = { 'buffers': 'tabsel' }


" vim-plug
nnoremap <leader>u :PlugUpdate<CR>


" vim-test
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>T :TestFile<<CR>
