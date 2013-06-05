set nocompatible

" call pathogen#runtime_append_all_bundles()
" call pathogen#infect()

" needed to install vim powerline
" set rtp+=~/vim/bundle/powerline/powerline/bindings/vim
" set encoding=utf-8
" let g:Powerline_symbols = "fancy"
"let g:Powerline_symbols = 'unicode'

" needed for powerline
" python import sys; sys.path.append("/Library/Python/2.7/site-packages")
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
filetype off

" makes searches case sensitive
set ignorecase smartcase
" highlights current line
set cursorline
" enable highlighting for syntax
syntax on
" autload indent files, to automatically do language-dependent indenting
filetype plugin indent on
set laststatus=2
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=2
set backspace=indent,eol,start " backspace over everything in insert mode
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
vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p
