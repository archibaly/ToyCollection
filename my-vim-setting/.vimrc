set nocompatible            " Use Vim defaults much better!
filetype off                " required!

" Encoding and file format
set ff=unix
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gb2312,cp936,gbk
set fdm=marker

set bs=2                    " allow backspacing over everything in insert mode
set history=50              " keep 50 lines of command line history
set ruler                   " show the cursor position all the time
set autoread

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


if &term=="xterm"
    set t_Co=8
    set t_Sb=^[4%dm
    set t_Sf=^[3%dm
endif


" Have the mouse enable all the time
set mouse=a

set nocp incsearch
set cinoptions=0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set invnumber
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4

syntax on
filetype indent on 
filetype plugin on

"Qucik Access.
"Set mapleader
let mapleader = ","

"Fast reloading of the .vimrc
map <silent> <leader>s :source $HOME/.vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>e :e $HOME/.vimrc<cr>
"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source $HOME/.vimrc


"注释//
nmap <silent> <leader>cm :s+^+//<cr>

"Smart way to move btw. windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"Tab configuration
map <leader>te :tabedit<cr>
map <leader>tm :tabmove<cr>
map <C-t> :tabnew<cr>
map <C-c> :tabclose<cr>
map <s-H> gT
map <s-L> gt



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,n~/.viminfo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set sessionoptions-=curdir
set sessionoptions+=sesdir

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
set ai
set si
set cindent
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" options
set complete-=u
set complete-=i

nnoremap ; :

"Fast quiting
nmap <silent> <leader>x :x<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>q :q<cr>
nmap <silent> <leader>qa :qa<cr>
nmap <silent> <leader>w :w<cr>
nmap <silent> <leader>G G$


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 31

nmap <F3> <ESC>:NERDTreeToggle<RETURN>
execute pathogen#infect()
let g:solarized_termtrans = 1
colorscheme darkburn
set t_Co=256



"My Bundles here:
" Syntax
Bundle 'python.vim--Vasiliev'
Bundle 'xml.vim'
Plugin 'faith/vim-go'
Bundle 'html5.vim'
Bundle 'JavaScript-syntax'
Bundle 'asciidoc.vim'

" Color
Bundle 'darkburn'

" Ftplugin
Bundle 'python_fold'
Bundle 'Javascript-Indentation'

" Indent
Bundle 'gg/python.vim'

" Plugin
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
