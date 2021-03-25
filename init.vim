"    _____   _____________    ________  ___
"   /  _/ | / /  _/_  __/ |  / /  _/  |/  /
"   / //  |/ // /  / /  | | / // // /|_/ / 
" _/ // /|  // /  / /   | |/ // // /  / /  
"/___/_/ |_/___/ /_(_)  |___/___/_/  /_/   

" author: somsky

"+=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+"
"+=--------------------------=+ GENERAL SETTINGS +=--------------------------=+"
"+=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+"

set number
set relativenumber
set nohlsearch
set scrolloff=5
set sidescrolloff=15
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set nowrap
set autoindent
set smartindent
set splitright
set splitbelow
set noswapfile
set ignorecase
set smartcase
set incsearch
set autoread
set undofile
set undodir=/tmp
set mouse +=a


" use system clipboard for copy/paste operations
set clipboard+=unnamedplus

" highlight on the line the carret is located
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Reload file contents on BufEnter
au FocusGained,BufEnter * :checktime

let mapleader = ","


"+=---------------------------=+ ~~~~~~~~~~~~~~ +=---------------------------=+"
"+=---------------------------=+ PLUGIN SECTION +=---------------------------=+"
"+=---------------------------=+ ~~~~~~~~~~~~~~ +=---------------------------=+"

call plug#begin('~/.local/share/nvim/plugged')
"+=----------------=+ SYNTAX +=----------------=+
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'leafgarland/typescript-vim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"+=----------------=+ THEMES +=----------------=+
  "Plug 'morhetz/gruvbox'
  "Plug 'drewtempelmeyer/palenight.vim'
  Plug 'sainnhe/sonokai'
  Plug 'mhartington/oceanic-next'
  Plug 'rktjmp/lush.nvim', {'branch': 'main'}
  Plug 'npxbr/gruvbox.nvim', {'branch': 'main'}
  "+=----------------=+ FILE HANDLING +=----------------=+
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
"+=----------------=+ QUALITY OF LIFE +=----------------=+
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'jiangmiao/auto-pairs'
"+=----------------=+ ADDITIONAL FUNCTIONALITY +=----------------=+
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
"+=----------------=+ BACKUP +=----------------=+
"Plug 'puremourning/vimspector'
"Plug 'calviken/vim-gdscript3'
"Plug 'dart-lang/dart-vim-plugin'
"Plug 'thosakwe/vim-flutter'
call plug#end()


set termguicolors
syntax on
colorscheme OceanicNext

"+=------------------------=+ ~~~~~~~~~~~~~~~~~~~ +=-------------------------=+"
"+=------------------------=+ COC COMPAT SETTINGS +=-------------------------=+"
"+=------------------------=+ ~~~~~~~~~~~~~~~~~~~ +=-------------------------=+"


" more information at https://github.com/neoclide/coc.nvim
set hidden          " if hidden is not set, TextEdit might fail.
set nobackup        " Some servers have issues with backup files, see #649
set nowritebackup
set updatetime=300  "update time for diagnostic messages
set shortmess+=c    " don't give ins-completion-menu messages.
set signcolumn=yes " always show signcolumns

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"+=------------------------------=+ ~~~~~~~~ +=------------------------------=+"
"+=------------------------------=+ KEY MAPS +=------------------------------=+"
"+=------------------------------=+ ~~~~~~~~ +=------------------------------=+"

noremap <Leader>s :update<CR>

" navigate between windows easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" vertical resizing
nnoremap <silent> <leader>r+ :vertical resize +20<CR>
nnoremap <silent> <leader>r- :vertical resize -20<CR>

" Buffer and File management
nnoremap <TAB> :bn<cr>
nnoremap <S-TAB> :bp<cr>
nmap <silent><leader>q :bd<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>cp :GFiles<cr>
nmap <leader>ff :Rg <cr>
nmap <silent> <leader>nt :NERDTreeToggle<cr>

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" triggers for specific plugin functionality
nmap <leader>mb :MarkdownPreview<cr>
nmap <leader>ms :MarkdownPreviewStop<cr>
nmap <Leader>vc :VimtexCompile<cr>

" reload init.vim
nmap <leader>rc :so ~/.config/nvim/init.vim<cr>

" coc-mappings
nmap <leader>en <Plug>(coc-diagnostic-prev)
nmap <leader>ep <Plug>(coc-diagnostic-next)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>fc <Plug>(coc-codeaction)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Switch between files of angular components fast
nnoremap <leader>at :edit %<.ts<CR>
nnoremap <leader>ah :edit %<.html<CR>
nnoremap <leader>ac :edit %<.scss<CR>

" Treesitter SETUP

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
}
EOF

"+=-------------------------------=+ ~~~~~ +=--------------------------------=+"
"+=-------------------------------=+ OTHER +=--------------------------------=+"
"+=-------------------------------=+ ~~~~~ +=--------------------------------=+"

" exclude filenames when searching with ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -F ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 

" vim-Airline Settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

if has('nvim')
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python'
    "let g:pudb_python='/usr/bin/python'
    "let g:pudb_breakpoint_symbol='☠'
endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" enable rainbow brackets by default
let g:rainbow_active = 1

" It should be:
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'latexbuild',
    \}

" vim markdown browser
let g:mkdp_browser = 'firefox'

