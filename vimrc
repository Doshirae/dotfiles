" Plugin Manager ==>
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'tpope/vim-surround' " Changing surround parenthesis 
Plugin 'tpope/vim-commentary' " Comment quickly lines
" Plugin 'scrooloose/syntastic' " Syntactic linting
Plugin 'w0rp/ale' " Syntactic linting
Plugin 'itchyny/lightline.vim' " The line
Plugin 'scrooloose/nerdtree' " NerdTree
" Plugin 'dhruvasagar/vim-table-mode'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-repeat' " enhanced '.'
Plugin 'rainbow_parentheses.vim' " Dunno
Plugin 'lilydjwg/colorizer' " Dunno either
Bundle 'vim-ruby/vim-ruby'
Plugin 'majutsushi/tagbar' " Have tags in a split with F8
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'johngrib/vim-game-code-break'
Plugin 'kovisoft/slimv'
Plugin 'flazz/vim-colorschemes'



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

" <==

" Colors==>
set background=dark
colorscheme molokai
"let g:molokai_original = 1
set t_Co=256

"hi CursorLine   cterm=NONE ctermbg=black
"let g:molokai_original = 1
"let g:rehash256 = 1
" <==

" Sets ==>
" Casse minuscule -> osef de la casse, une majuscules -> casse stricte
syntax on
set omnifunc=syntaxcomplete#Complete

autocmd Filetype ruby,eruby set omnifunc=rubycomplete#Complete
autocmd Filetype ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd Filetype ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd Filetype ruby,eruby let g:rubycomplete_rails = 1
set smartcase
set ignorecase
set nu
" set relativenumber
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
set undofile " Maintain undo history between sessions
set undodir=/tmp/vim-undo
set list lcs=tab:\|\ " put | to see indent level
" set list lcs=tab:»·,trail:·
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" <==

" Tabs ==>
set tabstop=2
set shiftwidth=2
" <==

" Folds ==>
set foldenable 
set foldlevelstart=10
set foldnestmax=10 
set modelines=1
set foldmethod=marker
set foldmarker=\=\=>,<\=\=:foldlevel=0
" <==

" Mapping ==>

imap jk <Esc>
imap <C-Space>    <CR><CR>end<Esc>-cc
nnoremap j gj
nnoremap k gk
inoremap µ \
" inoremap µ ||<Left>
nmap <Tab> :tabnext <CR>
nmap <S-Tab>  :tabprevious <CR> 

map <F8> :TagbarToggle<CR>

let mapleader=";"       " leader is semicolon
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>ev :tabnew ~/.dotfiles/vimrc<CR>
nnoremap <leader>ez :tabnew ~/.dotfiles/zshrc<CR>
nnoremap <leader>ei :tabnew ~/.dotfiles/i3/config<CR>
nnoremap <leader>sv :source ~/.dotfiles/vimrc<CR>
nnoremap <leader>cc :%s/\(\l\)\(\u\)/\1_\l\2/g<CR>
nnoremap <leader>CC :%s/\(\l\)_\(\l\)/\1\u\2/g<CR>

" TAble mode 
let g:table_mode_corner='|'

" Multi cursor plugin
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Nerdtree plugin
map <leader>n :NERDTreeToggle<CR>
"binding key to compiel to the java files
map éé :call CompileKinda()<CR>

func! CompileKinda()
exec "w"
if &filetype == 'java'
    exec "!clear && echo '>----Compiling------>' && javac % && echo '>---->Running------->' && java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
    exec "!bash %"
elseif &filetype == 'ruby'
    exec "!ruby %"
elseif &filetype == 'python'
    exec "!python3 %"
elseif &filetype == 'html'
    exec "!surf % &"
elseif &filetype == 'markdown'
    exec "!pandoc --latex-engine=xelatex % -o %.pdf && mupdf %.pdf"
elseif &filetype == 'c'
	exec "!gcc % -o %<"
	exec "!./%<"
elseif &filetype == 'lisp'
	exec "!clisp %"
endif
endfunc
" <==

" No_plugins==>
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
" let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
" let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Snippets
nnoremap ,bash :-1read $HOME/.dotfiles/snippets/bash.snippet<CR>3jwf>a
autocmd BufNewFile *.sh :-1read /home/doshirae/.dotfiles/templates/bash-template.sh


"<==

" Syntastic ==>
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"<==

" Lightline ==>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2 " bug where line appeared only on vsp
" <==

" Auto-pairs==>
let g:AutoPairsMultilineClose=0
let g:AutoPairsMapBS=0
" <==

" Ultisnips ==>
let g:UltiSnipsExpandTrigger="<tab>"
" <==

let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1
set clipboard+=unnamedplus
autocmd BufEnter *.md set expandtab
autocmd BufEnter *.hs set expandtab
autocmd Filetype *.md set conceallevel=2

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Rainbow Parentheses ==>

" Always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" <==

func CompileSlide()
	exec !~/.dotfiles/scripts/diapo.sh
endfunc

" vim:foldmethod=marker:foldmarker=\=\=>,<\=\=:foldlevel=0
