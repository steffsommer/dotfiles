set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Plugin 'Raimondi/delimitMate'
"imap <C-Tab> <Plug>delimitMateS-Tab

call vundle#end()
filetype plugin indent on
syntax on

colorscheme gruvbox 
set number
set wildmenu
set background=dark
let g:AirlineTheme='badwolf'
set laststatus=2



:command NT NERDTree


"let g:ycm_global_ycm_extra_conf='~/somsky.ycm_extra_conf.py'
"let g:ycm_autoclose_preview_window_after_completion=1

"ultisnips script to use enter to expand
"	let g:UltiSnipsExpandTrigger = "<nop>"
"	let g:ulti_expand_or_jump_res = 0
"	function ExpandSnippetOrCarriageReturn()
"	    let snippet = UltiSnips#ExpandSnippetOrJump()
"	    if g:ulti_expand_or_jump_res > 0
"	        return snippet
"	    else
"	        return "\<CR>"
"	    endif
"	endfunction
"inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
