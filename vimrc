set nocompatible "force using vim, not vi
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"----------------------------------------------------------------------- Vundle

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails.git'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'SirVer/ultisnips'
Bundle 'rstacruz/vim-ultisnips-css'
Bundle 'tComment'
Bundle 'tpope/vim-haml'
Bundle 'tcomment'
Bundle 'wincent/Command-T'
Bundle 'fugitive.vim'
Bundle 'surround.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Solarized'
Bundle 'vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'cocoa.vim'
Bundle 'neocomplcache'
Bundle 'taglist.vim'
Bundle 'Syntastic'
Bundle 'php.vim'
Bundle 'Tagbar'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ

"-------------------------------------------------------------------- Workspace
set number "line numbers
set ruler "column and row position
set colorcolumn=80 "column guide on the right
set scrolloff=5 "when scrolling, stay this far from extremes of buffer
set list listchars=tab:\ \ ,trail:· "show trailing whitespace
set smartindent "indent wisely
set autoindent "auto-indent
set wrap "soft-wrap text
set showcmd "see partial commands as you type them
set textwidth=79 "wrap above at this amount
set wrapmargin=2 "wrap buffer
set backspace=indent,eol,start "lazy backspacing
set showcmd "show the current command
set laststatus=2 "always show the status line. Always!
set showtabline=2 "show the tab line at the top, always
let loaded_matchparen = 1
set macmeta

" line break without going into insert mode
" map <S-Enter> O<Esc>
" map <Enter> o<Esc>


"--------------------------------------------------------------------- Mappings

let mapleader = ","

"map space to normal mode
nnoremap <space> :

"jj and ;; to escape!
inoremap jj <esc>

" make it so that j and k jump visual lines instead of file lines
nnoremap j gj
nnoremap k gk

"quickly edit vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

"textmate indentation mappings
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

"split lines (opposite of J)
"nnoremap <C-J> a<CR><Esc>k$"

"no more accidentally losing undo history
nmap <s-r> <c-r>

"map search to ack
nmap <D-S-F> :Ack<space>
noremap <Leader>a :Ack <cword><cr>


"map nerdtree
map <D-D> :NERDTreeToggle<cr>
nmap ,n :NERDTreeFind<CR>

"reformat after paste
:nnoremap <Esc>p p'[v']=
:nnoremap <Esc>P P'[v']=

"----------------------------------------------------------------------- Syntax
syntax on "turn on syntax highlighting



"----------------------------------------------------------------------- Search
set incsearch "incremental searching
set ignorecase "case-insenitive searching
set smartcase "do a case-sensitive search if uppercase letters are present
set hlsearch "highlight search results

" clears the current highlighted search
nmap <silent> <leader>/ :nohlsearch<cr>


"--------------------------------------------------------------------- Wildmenu
set wildmenu "turn on wildmenu
set wildmode=list:longest,full "default to longest match first


"------------------------------------------------------------------------- Tabs
set tabstop=2 "how wide is a tab?
set shiftwidth=2 "how much to reindent
set softtabstop=2 "use 2 spaces
set expandtab "we use spaces, not hard tabs
set formatoptions=qrn1 "I've forgotten what this does, but it helps...somehow


"---------------------------------------------------------------------- Folding
set foldmethod=syntax "we fold based on syntax
set foldnestmax=5 "max level of folds
set foldlevel=10 "level above and beyond to automatically fold
set foldcolumn=2 "width of the column that marks the folds

let ruby_fold=1 "fold ruby!


"---------------------------------------------------------------------- Windows
" easily move between windows with Ctrl+hjkl
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" screw taglist; yay tabs!

" easily resize windows with + and -
if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
end

" window size management
set winwidth=84
" we have to have a winheight bigger than we want to set winminheight, but if
" we set winheight to be huge before winminheight, winminheight set will always
" fail
set winheight=5
set winminheight=5
" set winheight=600
set previewheight=50

" super splitting!
" window
nmap <leader>swh :topleft vnew<cr>
nmap <leader>swl :botright vnew<cr>
nmap <leader>swk :topleft new<cr>
nmap <leader>swj :botright new<cr>
" buffer
nmap <leader>sh :leftabove vnew<cr>
nmap <leader>sl :rightbelow vnew<cr>
nmap <leader>sk :leftabove new<cr>
nmap <leader>sj :rightbelow new<cr>


"------------------------------------------------------------------------- Misc
filetype plugin indent on "detect filetype automatically

set encoding=utf-8 "default character encoding
set shell=/bin/sh "play nice with RVM

" write files as su
cmap W w !sudo tee % > /dev/null



"--------------------------------------------------------------------- Autocmds
" reload vimrc as soon as we're done editing it
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"-------------------------------------------------------------------- Filetypes
au BufRead,BufNewFile *.md set filetype=markdown
" au BufRead,BufNewFile *.php set filetype=php.html



"-------------------------------------------------------------------- Command-T
let g:CommandTMaxHeight=20 "restrict the max height of buffer
"set flush
nmap <leader>t :CommandTFlush<cr>\|:CommandT<cr>


"-------------------------------------------------------------------- Zencoding
let g:user_zen_expandabbr_key = '<c-e>'

let g:use_zen_complete_tag = 1

"------------------------------------------------------------------------ Rspec
"
map <D-r> :SweetVimRspecRunFile<CR>
map <D-R> :SweetVimRspecRunFocused<CR>
map <M-D-r> :SweetVimRspecRunPrevious<CR>

"----------------------------------------------------------------------- Colors
colorscheme solarized "use solarized color scheme

"
set background=dark "use the light solarized scheme (other option is 'dark')
call togglebg#map("<F5>")

" turn off the annoying top bar in MacVim
if has("gui_running")
 set guioptions=egmrt
endif

" "----------------------------------------------------------------------ultiSnip
" let g:UltiSnipsEditSplit = "vertical"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"----------------------------------------------------------------------snipMate
let g:snippets_dir = "~/.vim/snippets/"

"---------------------------------------------------------------------CocoaPods
au BufNewFile,BufRead Podfile,*.podspec      set filetype=ruby

"-----------------------------------------------------------------neocomplcache

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 0

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()



"---------------------------------------------------------------------syntastic
let g:syntastic_check_on_open=1

"-----------------------------------------------------------------------php.vim

"syntax highlighting for SQL in strings
let php_sql_query = 1

" Enable HTML syntax highlighting inside strings
let php_htmlInStrings = 1

"php folding
let php_folding = 1

"------------------------------------------------------------------------tagbar
nmap <leader><Tab> :TagbarToggle<CR>


"-------------------------------------------------------------------------ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <M-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
