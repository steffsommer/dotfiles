
" show relative line numbers
set number
" set relativenumber

" no search highlighting
set nohlsearch

" scroll before cursor gets to end of screen
set scrolloff=5
set sidescrolloff=15

let mapleader = ","

" spaces instead of tabs
set expandtab

" indentation
set tabstop=2
set shiftwidth=2

set nowrap

" scroll down with arroy keys
map <Down> <c-e>
map <Up> <c-y>

call plug#begin('~/.local/share/nvim/plugged')

  Plug 'scrooloose/nerdtree'
  Plug 'morhetz/gruvbox'

  Plug 'vim-airline/vim-airline'
  Plug 'leafgarland/typescript-vim'

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jremmen/vim-ripgrep'

  Plug 'Raimondi/delimitMate'
  Plug 'vim-scripts/yankRing.vim'

  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

colorscheme gruvbox
set background=dark
