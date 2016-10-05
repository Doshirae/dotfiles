" Plugin Manager {{{
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
Bundle 'godlygeek/tabular'
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

" }}}

" Colors{{{
set background=dark
"colorscheme molokai
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
"let g:molokai_original = 1
"let g:rehash256 = 1
" }}}

" Sets {{{
" Casse minuscule -> osef de la casse, une majuscules -> casse stricte
syntax on
set smartcase
set nu
set relativenumber
set incsearch
set hlsearch
set title
set ruler
set wrap
set mouse=a
set diffopt=vertical
set showcmd
set cursorline
set wildmenu
set lazyredraw
" }}}

" Tabs {{{
set tabstop=4
set shiftwidth=4
" }}}

" Folds {{{
set foldenable 
set foldlevelstart=10
set foldnestmax=10 
set foldmethod=indent
set modelines=1
" }}}

" Highlight {{{
highlight Redundantlines ctermbg=blue guibg=blue
match Redundantlines /^\(.*\)\(\n\1\)\+$/       
" }}}

" Mapping {{{

imap jk <Esc>
nnoremap j gj
nnoremap k gk
map <C-j>  :tabnew <CR>
map <C-k> :tabclose <CR>
nmap <C-l> :tabnext <CR>
nmap <C-h>  :tabprevious <CR> 

nnoremap <leader><space> :nohlsearch<CR>
let mapleader=","       " leader is comma

nnoremap <leader>ev :vsp ~/dotfiles/.vimrc<CR>
nnoremap <leader>ez :vsp ~/dotfiles/.zshrc<CR>
nnoremap <leader>ei :vsp ~/dotfiles/.config/i3/config<CR>
nnoremap <leader>sv :source ~/dotfiles/.vimrc<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
