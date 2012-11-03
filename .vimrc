" ~/.vimrc

" General Settings

if has('gui_running')
    colorscheme desert
    map <F2> :call LaunchGUITerminal()<CR>
    map <F3> :call LaunchGUIPyInterpreter()<CR>
    set lines=33
    set columns=93
    set guifont=Monospace\ 11
    set guioptions-=m
    set guioptions-=r
    set guioptions-=T
    set guicursor+=a:blinkon0
else
    colorscheme default
    map <F2> :call LaunchTerminal()<CR>
    map <F3> :call LaunchPyInterpreter()<CR>
endif

filetype plugin indent on
syntax on

set autoindent
set autoread
set background=dark
set backspace=2
set encoding=utf-8
set equalalways
set expandtab
set formatoptions=c,q,r,t
set grepprg=grep\ -nH\ $*
set hidden
set history=5000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noautowrite
set nobackup
set nocompatible
set noerrorbells
set nolist
set noshowmatch
set nospell
set noswapfile !
set nowritebackup
set number
set report=0
set ruler
set shell=/bin/zsh
set shiftwidth=4
set showcmd
set showmode
set smartcase
set smartindent
set smarttab
set tabstop=4
set textwidth=55
set ttyfast
set wildmenu
set wrap
set wrapmargin=0
set wrapscan

" Custom Settings

map <F4>    :call   CompileCProgram()<CR>
map <F5>    :call   CompileAndRunCProgram()<CR>
map <F6>    :call   CompileCPPProgram()<CR>
map <F7>    :call   CompileAndRunCPPProgram()<CR>
map <F8>    :call   CompileJavaProgram()<CR>
map <F9>    :call   CompileAndRunJavaProgram()<CR>
map <F10>   :call   InterpretPyProgram()<CR>
map ;h      :call   MakeHTMLDocFromSource()<CR>
map ;t      :call   MakePDFDocFromTeX()<CR>
map ;l      :call   MakePDFDocFromLaTeX()<CR>

nmap <silent> ;s :call ToggleHighlight()<CR>

nnoremap <silent> <C-l> :nohl<CR><C-l>
autocmd BufRead /tmp/mutt-* set textwidth=72

" User-Defined Functions

function! ToggleHighlight()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction

function! LaunchTerminal()
    exec "sh"
endfunction

function! LaunchGUITerminal()
    exec "!urxvtc &"
endfunction

function! CompileCProgram()
  exec "w"
  exec "!gcc -pedantic -ansi -Werror -Wall -Wextra -O % -o %<"
endfunction

function! CompileAndRunCProgram()
  exec "w"
  exec "!gcc -pedantic -ansi -Werror -Wall -Wextra -O % -o %< && ./%<"
endfunction

function! CompileCPPProgram()
  exec "w"
  exec "!g++ -pedantic -ansi -Werror -Wall -Wextra -O % -o %<"
endfunction

function! CompileAndRunCPPProgram()
  exec "w"
  exec "!g++ -pedantic -ansi -Werror -Wall -Wextra -O % -o %< && ./%<"
endfunction

function! CompileJavaProgram()
    exec "w"
    exec "!javac %"
endfunction

function! CompileAndRunJavaProgram()
    exec "w"
    exec "!javac % && java %<"
endfunction

function! LaunchPyInterpreter()
    exec "!/usr/bin/python"
endfunction

function! LaunchGUIPyInterpreter()
    exec "urxvt -e /usr/bin/python &"
endfunction

function! InterpretPyProgram()
    exec "!/usr/bin/python %"
endfunction

function! MakeHTMLDocFromSource()
    exec "!source-highlight %"
endfunction

function! MakePDFDocFromTeX()
    exec "!pdftex %"
endfunction

function! MakePDFDocFromLaTeX()
    exec "!pdflatex %"
endfunction

" EOF.
