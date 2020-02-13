
"   _   ________  ______  _____
"  | | / /  _/  |/  / _ \/ ___/
"  | |/ // // /|_/ / , _/ /__  
"  |___/___/_/  /_/_/|_|\___/  

" author: somsky

" ===============================
" ======= PLUGIN SECTION ========
" ===============================

call plug#begin('~/.local/share/nvim/plugged')

  " colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'kaicataldo/material.vim'  
  Plug 'PotatoesMaster/i3-vim-syntax'

  " file explorer
  Plug 'scrooloose/nerdtree'
  " Plug 'ryanoasis/vim-devicons'

  " syntax Highlighting for Typescript
  Plug 'leafgarland/typescript-vim'

  " auto-close brackets
  Plug 'Raimondi/delimitMate'

  " code completion engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
 
  " Fuzzy find files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Show indentation
  Plug 'Yggdroot/indentLine'

  "Dart/Flutter Support
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'

  " Tex Support
  Plug 'lervag/vimtex'
  Plug 'Konfekt/FastFold'
  Plug 'matze/vim-tex-fold'

  " ========
  " Plugins to keep in Mind for the future
  " ========

  " Change/add/delete brackets for words
  " Plug 'tpope/vim-surround' 
  
  " Quickly comment in/out pieces of code
  " Plug 'preservim/nerdcommenter'

  
call plug#end()

" ===============================
" ===== COC COMPAT SETTINGS =====
" ===============================

" more information at https://github.com/neoclide/coc.nvim

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
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
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ====================================
" ===== PERSONAL VIM PREFERENCES =====
" ====================================

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

" Don't wrap lines
set nowrap

" Character encoding
set encoding=UTF-8

" scroll down with arroy keys
map <Down> <c-e>
map <Up> <c-y>

" select colorscheme
set background=dark
colorscheme gruvbox

" more natural opening of splits
set splitright
set splitbelow

" slight highlight on line number and line where the carret is located
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" ====================================
" ==== PERSONAL PLUGIN PREFERENCES ===
" ====================================

" vim-Airline Settings
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled=1

" custom keybindings
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>ff :Ag<cr>
nmap <leader>cp :GFiles<cr>

" Latex Support
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

" Nvim python environment settings
" used for pudb plugin
if has('nvim')
    let g:python_host_prog='/usr/bin/python'
    let g:python3_host_prog='/usr/bin/python3'
    let g:pudb_python='/usr/bin/python3'
    let g:pudb_breakpoint_symbol='☠'
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Execute FZF in a floating window
function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
