
"   _   ________  ______  _____
"  | | / /  _/  |/  / _ \/ ___/
"  | |/ // // /|_/ / , _/ /__  
"  |___/___/_/  /_/_/|_|\___/  

" author: somsky

" ===============================
" ====== CONFIGURE PLUGINS ======
" ===============================

call plug#begin('~/.local/share/nvim/plugged')

  " colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'kaicataldo/material.vim'  
  
  " File Explorer
  Plug 'scrooloose/nerdtree'

  " Typescript support
  Plug 'leafgarland/typescript-vim'

  " Fuzzy File Finder
  Plug 'ctrlpvim/ctrlp.vim'

  " Plug 'Raimondi/delimitMate'
  " Plug 'vim-scripts/yankRing.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Plug 'vim-vdebug/vdebug'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

call plug#end()

" ===============================
" ===== COC COMPAT SETTINGS =====
" ===============================

" more information at https://github.com/neoclide/coc.nvim

set hidden
set nobackup
set nowritebackup

" Better display for status messages
set cmdheight=2

" Counter slow feedback from diagnostic messages (default: 4000)
set updatetime=300

set shortmess+=c

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)<Paste>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
  	execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" ================================
" ===== PERSONAL PREFERENCES =====
" ================================

" show line numbers
set number

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

set background=dark
colorscheme material
let g:airline_theme='deus'

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" custom keybindings
let mapleader = ","
nmap <leader>nt :NERDTree<cr>

nmap <leader>fp :CtrlP<cr>
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" Nvim python environment settings
" used for pudb plugin
if has('nvim')
  let g:python_host_prog='/usr/bin/python'
  let g:python3_host_prog='/usr/bin/python3'
  " set the virtual env python used to launch the debugger
  let g:pudb_python='/usr/bin/python3'
  " Unicode symbols work fine (nvim, iterm, tmux, nyovim tested)
  let g:pudb_breakpoint_symbol='☠'
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
