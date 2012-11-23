" ~/.vimrc

" General Settings

if has('gui_running')
    colorscheme desert
    set lines=33
    set columns=93
    set guifont=Monospace\ 11
    set guioptions-=m
    set guioptions-=r
    set guioptions-=T
    set guicursor+=a:blinkon0
else
    colorscheme default
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

map <F2> :call LaunchTerminal()<CR>
map <F3> :call LaunchPyInterpreter()<CR>
map <F4> :call LauchProgramDebugger()<CR>
map <F5> :call CompileProgram()<CR>
map <F6> :call TimeProgramCompilation()<CR>
map <F7> :call RunProgram()<CR>
map <F8> :call TimeProgramRun<CR>
map ;h   :call MakeHTMLDocFromSource()<CR>

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
    if has('gui_running')
        exec "!urxvtc &"
    else
        exec "sh"
    endif
endfunction

function! LaunchPyInterpreter()
    if has('gui_running')
        exec "!urxvtc -e python &"
    else
        exec "!python"
    endif
endfunction

function! LaunchProgramDebugger()
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!gdb ./%<"
    elseif &filetype == 'java'
        exec "!jdb %<"
    elseif &filetype == 'python'
        exec "pydb %"
    else
        echo "No match found for file type!"
    endif
endfunction

function! CompileProgram()
  exec "w"
  if &filetype == 'c'
      exec "!gcc -pedantic -ansi -Werror -Wall -Wextra -O % -o %<"
  elseif &filetype == 'cpp'
      exec "!g++ -pedantic -ansi -Werror -Wall -Wextra -O % -o %<"
  elseif &filetype == 'java'
      exec "!javac %<"
  else
      echo "No match found for file type!"
  endif
endfunction

function! TimeProgramCompilation()
  exec "w"
  if &filetype == 'c'
      exec "!/usr/bin/time -v gcc -pedantic -ansi -Werror -Wall -Wextra -O % -o %<"
  elseif &filetype == 'cpp'
      exec "!/usr/bin/time -v g++ -pedantic -ansi -Werror -Wall -Wextra -O % -o %<"
  elseif &filetype == 'java'
      exec "!/usr/bin/time -v javac %<"
  else
      echo "No match found for file type!"
  endif
endfunction

function! RunProgram()
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!./%<"
    elseif &filetype == 'java'
        exec "!java %<"
    elseif &filetype == 'python'
        exec "!python %"
    else
        echo "No match found for file type!"
    endif
endfunction

function! TimeProgramRun()
    if &filetype == 'c' || &filetype == 'cpp'
        exec "!/usr/bin/time -v ./%<"
    elseif &filetype == 'java'
        exec "!/usr/bin/time -v java %<"
    elseif &filetype == 'python'
        exec "!/usr/bin/time -v python %"
    else
        echo "No match found for file type!"
    endif
endfunction

function! MakeHTMLDocFromSource()
    exec "!source-highlight %"
endfunction

" EOF.
