set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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

""" VIM-AIRLINE """
set noshowmode
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_a = airline#section#create(['mode'])
let g:airline_section_b = airline#section#create(['branch', 'hunks'])
let g:airline_section_z = airline#section#create(['%B', '@', '%l', ':', '%c'])

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
set statusline=%<%f%m\ %r\ %h\ %w%=%l,%c\ %p%%\ [%{strftime('%a\ %d/%m/%y\ %H:%M:%S')}]
set wrap
set mouse=a
set t_Co=256
colorsche mustang
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
map 2H :w<CR>:!echo "<head><meta charset=\"UTF-8\">" > /tmp/apercu.html;markdown "%" >> /tmp/apercu.html ; cd ~ ; surf "file:///tmp/apercu.html" <CR>
