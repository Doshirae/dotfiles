" Plugin Manager {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'godlygeek/tabular'
Plugin 'wincent/command-t'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
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
colorscheme distinguished
set t_Co=256

"hi CursorLine   cterm=NONE ctermbg=black
"let g:molokai_original = 1
"let g:rehash256 = 1
" }}}

" Sets {{{
" Casse minuscule -> osef de la casse, une majuscules -> casse stricte
syntax on
set omnifunc=syntaxcomplete#Complete
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
"set cursorline
set wildmenu
set splitright
set lazyredraw
" }}}

" Tabs {{{
set tabstop=4
set shiftwidth=4
"set expandtab
" }}}

" Folds {{{
set foldenable 
set foldlevelstart=10
set foldnestmax=10 
set foldmethod=indent
set modelines=1
" }}}

" Mapping {{{

imap jk <Esc>
nnoremap j gj
nnoremap k gk
map <C-j>  :tabnew <CR>
map <C-k> :tabclose <CR>
nmap <C-l> :tabnext <CR>
nmap <C-h>  :tabprevious <CR> 

let mapleader=";"       " leader is semicolon
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>ev :vsp ~/dotfiles/.vimrc<CR>
nnoremap <leader>ez :vsp ~/dotfiles/.zshrc<CR>
nnoremap <leader>ei :vsp ~/dotfiles/.config/i3/config<CR>
nnoremap <leader>sv :source ~/dotfiles/.vimrc<CR>
" }}}

" No_plugins{{{
set path+=** "Activer la recherche récursive
command! MakeTags !ctags -R . 
" ↑↑↑
"^] pour aller à la def du tag sous le curseur
"g^] quand c'est ambigu
"^t pour retourner au tag où on était

" Autocompletion
" ^n/^p
" ^x^f pour un fichier

" File browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Snippets
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap ,reveal :-1read $HOME/.vim/.skeleton.reveal.html<CR>4jwf>a
nnoremap ,dosh :e scp://doshirae@www.doshirae.fr//data/www/index.html<CR>

"}}}

" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" vim:foldmethod=marker:foldlevel=0
