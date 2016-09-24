set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""" VIM SETTINGS """

syntax on
" Casse minuscule -> osef de la casse, une majuscules -> casse stricte
set smartcase
set background=dark
" Numéros de ligne dans la marge
set nu
set relativenumber
set incsearch
set hlsearch
set title
set ruler
set wrap
set mouse=a
set t_Co=256
set diffopt=vertical
" Activer le correcteur orthographique sur les fichiers markdown
"
" Corriger un mot : mettre le curseur sur le mot, puis taper z=
" Définir un mot comme juste : zg
" Définir un mot comme non-juste : zug
" Prochain mot faux : ]s 
"au BufNewFile,BufRead *.md set spell
"au BufNewFile,BufRead *.md setlocal spell spelllang=fr
highlight Redundantlines ctermbg=blue guibg=blue
match Redundantlines /^\(.*\)\(\n\1\)\+$/       

" Raccourcis

map <C-j>  :tabnew <CR>
map <C-k> :tabclose <CR>
nmap <C-l> :tabnext <CR>
nmap <C-h>  :tabprevious <CR> 
imap jk <Esc>
