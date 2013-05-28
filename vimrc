call pathogen#infect()
call pathogen#helptags()

" makes searches case sensitive
set ignorecase smartcase
" highlights current line
set cursorline
" enable highlighting for syntax
syntax on
" autload indent files, to automatically do language-dependent indenting
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=2
" show matching brace
set showmatch
" show cursor position at all times
set ruler
set incsearch
" open new splitpanes to the right and bottom
set splitbelow
set splitright

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set t_Co=256 " 256 colors
:set background=dark
:color zenburn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" arrow keys are unacceptable
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>
