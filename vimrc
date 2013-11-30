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
" inserts spaces when hitting tab
set expandtab
" lines longer than 79 columns will be broken
set textwidth=79
" a hard tab displays as 4 columns
set tabstop=2
set shiftwidth=2
" insert/delete 4 spaces when hitting tab/backspace. used to =2
set softtabstop=2
" round indent to multipe of 'shiftwidth'
set shiftround
" align the new line indent with the previous line
set autoindent
" backspace over everything in insert mode
set backspace=indent,eol,start
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
