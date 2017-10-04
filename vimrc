" Plugins ==>
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' " Changing surround parenthesis
Plug 'tomtom/tcomment_vim' " Comment quickly lines
Plug 'itchyny/lightline.vim' " The line
Plug 'sheerun/vim-polyglot' " Syntax highlighting
Plug 'w0rp/ale' " Syntactic linting
Plug 'godlygeek/tabular' " align things
Plug 'tpope/vim-endwise' " Auto put end in ruby
Plug 'qpkorr/vim-renamer' " Bulk rename files
Plug 'cohama/lexima.vim' " Auto close parentheses
Plug 'luochen1990/rainbow' " Rainbow parentheses (useful in Lisp, cool in every other language)
Plug 'kovisoft/slimv' " Slimv for Lisp
" Plug 'http://git.foldling.org/vim-scheme.git' " Cool for scheme
Plug 'junegunn/goyo.vim' " Purify interface
" Plugin 'ctrlpvim/ctrlp.vim'
call plug#end()
" <==

" User settings ==>
" sets ==>
syntax on
let mapleader = ';'
set smartcase
set ignorecase
set ttyfast " Améliore l'affichage en disant à vim que nous utilisons un terminal rapide
set backupdir=~/.dotfiles/vim/tmp/ " for the backup files
set directory=~/.dotfiles/vim/tmp/ " for the swap files
set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start

set nu " Print line numbers
set incsearch " Search through the whole file
set hlsearch " Highlight the search
set title
set ruler " Affiche la position du curseur en bas à droite
set wrap
set mouse=a
set diffopt=vertical
set showcmd
set showmatch " Montre les () <> {} [] correspondants
set wildmenu
set splitright
set lazyredraw
set undofile " Maintain undo history between sessions
set undodir=/.dotfiles/vim/undo
" set list lcs=tab:\|\ " put | to see indent level
" set list lcs=tab:»·,trail:·
set path+=** "Activer la recherche récursive
set clipboard+=unnamedplus
set foldmethod=marker
set foldmarker=\=\=>,<\=\=
set foldlevel=0
" Tabs
set tabstop=2
set shiftwidth=2

let g:AutoPairsMultilineClose=0
let g:AutoPairsMapBS=0
set nocompatible

" UTF-8 everywhere !
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set showcmd
set list " pour afficher les machins affreux qui sont cacher (les tab et les endl)
set listchars=tab:\|·,trail:·,extends:$,nbsp:=  " pour rendre les trucs affiché par list un peu moins moche
if has("autocmd")
    " Détection auto du format
    " + activer indent
    filetype plugin indent on
endif
" <==
" maps ==>
command! MakeTags !ctags -R .
" ↑↑↑
"^] pour aller à la def du tag sous le curseur
"g^] quand c'est ambigu
"^t pour retourner au tag où on était
" Allows to sudo a file to save it when sudo was forgot
cmap w!! %!sudo tee > /dev/null %

imap jk <Esc>
nnoremap j gj
nnoremap k gk
nmap <silent> <C-l> :tabnext <CR>
nmap <silent> <C-h> :tabprevious <CR>
nnoremap <silent> <leader><space> :nohlsearch<CR>
" Often edit these files
nnoremap <silent> <leader>ev :tabnew ~/.dotfiles/vimrc<CR>
nnoremap <silent> <leader>ez :tabnew ~/.dotfiles/zshrc<CR>
nnoremap <silent> <leader>ei :tabnew ~/.dotfiles/i3/config<CR>
nnoremap <silent> <leader>eb :tabnew ~/.dotfiles/i3/polybar/polybar.conf<CR>
" reloads<silent> .vimrc -- making all changes active
map <silent> <Leader>sv :source ~/.dotfiles/vimrc<CR>:PlugInstall<CR>:PlugClean<CR>:bdelete<CR>:exe ":echo 'vimrc reloaded'"<CR>
imap <C-Space> <C-X><C-O> " Remap completion on C-Space
map éé :call Launch()<CR>
" <==
" Colors ==>
set background=dark
colorscheme gruvbox
set t_Co=256
hi Search  term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
" <==
" autocmds ==>
autocmd Filetype ruby,eruby set omnifunc=rubycomplete#Complete
autocmd Filetype ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd Filetype ruby,eruby let g:rubycomplete_classes_in_global=1
autocmd Filetype ruby,eruby let g:rubycomplete_rails = 1
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

au Filetype scheme call lexima#add_rule({ 'char': "'",  'input': "'", 'filetype': ['lisp', 'scheme'] })
au Filetype scheme call lexima#add_rule({ 'char': "`",  'input': "`", 'filetype': ['lisp', 'scheme'] })
" <==
" Functions ==>
func! Launch()
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
	elseif &filetype == 'scheme'
		exec "!csi -script %"
	elseif &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!./%<"
	elseif &filetype == 'go'
		exec "!go run %"
	elseif &filetype == 'tex'
		exec "!pdflatex % && mupdf %:r.pdf"
	endif
endfunc
" <==
" <==

" Netrw (replacement of NERDTree) ==>
let g:netrw_winsize = -28             " absolute width of netrw window
let g:netrw_liststyle = 3             " tree-view
let g:netrw_sort_sequence = '[\/]$,*' " sort is affecting only: directories on the top, files below
let g:netrw_browse_split = 3          " open file in a new tab

let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" <==

" Plugins ==>
noremap <silent> <Leader>cc :TComment<CR>

" Lightline ==>
let g:lightline = {'colorscheme': 'jellybeans',}
set laststatus=2 " bug where line appeared only on vsp
set noshowmode " N'affiche pas le insert en plus de vim (on s'en branle sérieux)
" <==
" Tabular ==>
vnoremap <silent> <Leader>te    :Tabularize /=<CR>
vnoremap <silent> <Leader>ts    :Tabularize /#<CR>
vnoremap <silent> <Leader>t     :Tabularize /
" <==
" Rainbow Parentheses ==>

" au VimEnter * RainbowParenthesesToggle " au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['blue', 'yellow', 'cyan', 'magenta', 'red'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" <==
" <==
