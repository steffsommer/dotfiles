"    _____   _____________    ________  ___
"   /  _/ | / /  _/_  __/ |  / /  _/  |/  /
"   / //  |/ // /  / /  | | / // // /|_/ / 
" _/ // /|  // /  / /   | |/ // // /  / /  
"/___/_/ |_/___/ /_(_)  |___/___/_/  /_/   

" For VS Code Neovim Integration (https://github.com/asvetliakov/vscode-neovim)
" Written with <3 by steffsommer

" author: steffsommer

set nohlsearch
set incsearch
set smartcase

" use system clipboard
set clipboard+=unnamedplus

"+=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+"
"+=--------------------------=+ KEYBOARD MAPPING +=--------------------------=+"
"+=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+"


let mapleader = ","


""""""" navigation between windows """""""


nnoremap <leader>bd <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

" split vertically
nnoremap <leader>sv <Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>

" Go to tab #x{1,9}
nnoremap <leader>1 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex1')<CR>
nnoremap <leader>2 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex2')<CR>
nnoremap <leader>3 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex3')<CR>
nnoremap <leader>4 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex4')<CR>
nnoremap <leader>5 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex5')<CR>
nnoremap <leader>6 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex6')<CR>
nnoremap <leader>7 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex7')<CR>
nnoremap <leader>8 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex8')<CR>
nnoremap <leader>9 <Cmd>call VSCodeNotify('workbench.action.openEditorAtIndex9')<CR>

" Open explorer
nnoremap <leader>oe <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>

" Search in Project
nnoremap <leader>fp <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>

" Ctrl + P, Open File by Name Matching
nnoremap <leader>cp <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>


""""""" Semantic navigation """""""


" go to next error
nnoremap <leader>en <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
nnoremap <leader>En <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>

" go to previous error
nnoremap <leader>ep <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
nnoremap <leader>Ep <Cmd>call VSCodeNotify('editor.action.marker.editor.action.marker.prevInFiles')<CR>

" go to definition
nnoremap <leader>gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>

" go to symbol
nnoremap <leader>gs <Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>


""""""" Refactoring """""""


" rename Symbol
nnoremap <leader>rn <Cmd>call VSCodeNotify('editor.action.rename')<CR>


""""""" other """""""


" Show documentation for symbol under carret
nnoremap <leader>sd <Cmd>call VSCodeNotify('editor.action.showDefinitionPreviewHover')<CR>

" Select colorscheme
nnoremap <leader>sc <Cmd>call VSCodeNotify('workbench.action.selectTheme')<CR>

" Format file
nnoremap <leader>ff <Cmd>call VSCodeNotify('editor.action.formatDocument')<CR>

" write file (save cannot be used to to the split vertically (sv) binding)
nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>

" comment out lines
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

" use system clipboard
set clipboard+=unnamedplus



""""""" Angular File Switcher Extension """""""
nnoremap <leader>at <Cmd>call VSCodeNotify('ng-file-switcher.openTypescript')<CR>
nnoremap <leader>ah <Cmd>call VSCodeNotify('ng-file-switcher.openHTML')<CR>
nnoremap <leader>ac <Cmd>call VSCodeNotify('ng-file-switcher.openStyle')<CR>
nnoremap <leader>as <Cmd>call VSCodeNotify('ng-file-switcher.openTest')<CR>

