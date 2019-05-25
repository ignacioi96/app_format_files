" --- text editor settings ---
syntax enable
let g:solarized_termcolor=256
set background=dark
colorscheme solarized	
set splitbelow
set splitright
set ruler
set number
let g:SimplyFold_docstring_preview=1
set encoding=utf-8

"" Highlight vars
let g:no_highlight_group_for_current_word=["Statement", "Comment", "Type", "PreProc"]
function s:HighlightWordUnderCursor()
    let l:syntaxgroup = synIDattr(synIDtrans(synID(line("."), stridx(getline("."), expand('<cword>')) + 1, 1)), "name")

    if (index(g:no_highlight_group_for_current_word, l:syntaxgroup) == -1)
        exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    else
        exe 'match IncSearch /\V\<\>/'
    endif
endfunction

autocmd CursorMoved * call s:HighlightWordUnderCursor()
"""

""" Leader #leader
let g:mapleader='\\'

"" Format Options #format-options
set formatoptions=tcrq
set textwidth=80
set foldmethod=indent
set foldlevel=99

"" Libraries
call plug#begin()
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'tmhedberg/SimpylFold'
Plug 'sbdchd/neoformat'
Plug 'vim-scripts/indentpython.vim'
Plug 'flowtype/vim-flow'
Plug 'junegunn/vim-easy-align'
call plug#end()

" Extras
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" FullStack dev e.g. js, css, html
autocmd BufWritePre *.js Neoformat
au BufNewFile, BufRead *.js, *.html, *.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" Python
au BufNewFile, BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix
autocmd FileType python setlocal formatprg=autopep8\ - 
