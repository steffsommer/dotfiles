
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

  " colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'kaicataldo/material.vim'  
  
  Plug 'scrooloose/nerdtree'

  Plug 'vim-airline/vim-airline'
  Plug 'leafgarland/typescript-vim'

  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jremmen/vim-ripgrep'

  Plug 'Raimondi/delimitMate'
  Plug 'vim-scripts/yankRing.vim'

  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

set background=dark
colorscheme material

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
