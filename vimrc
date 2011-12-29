call pathogen#infect()

"-------------------------------------------------------------------- Workspace
set number "line numbers
set ruler "column and row position
set cursorline "highlight the current line
set colorcolumn=80 "column guide on the right
set scrolloff=5 "when scrolling, stay this far from extremes of buffer
set list listchars=tab:\ \ ,trail:· "show trailing whitespace
set smartindent "indent wisely
set autoindent "auto-indent
set wrap "soft-wrap text
set textwidth=79 "wrap above at this amount
set wrapmargin=2 "wrap buffer
set backspace=indent,eol,start "lazy backspacing
set showcmd "show the current command
set laststatus=2 "always show the status line. Always!
set showtabline=2 "show the tab line at the top, always

" line break without going into insert mode
map <S-Enter> O<Esc>
map <Enter> o<Esc>


"----------------------------------------------------------------------- Syntax
syntax on "turn on syntax highlighting

set showmatch "highlight matching [] and {}


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
nmap <C-[> :tabprevious<cr>
nmap <C-]> :tabnext<cr>

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
set winheight=999

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

set nocompatible "force using vim, not vi
set encoding=utf-8 "default character encoding
set shell=/bin/sh "play nice with RVM

" write files as su
cmap W w !sudo tee % > /dev/null

"--------------------------------------------------------------------- Mappings
"map space to normal mode
nnoremap <space> :

"jj to escape!
inoremap jj <esc>

" make it so that j and k jump visual lines instead of file lines
nnoremap j gj
nnoremap k gk

"quickly edit vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>


"--------------------------------------------------------------------- Autocmds
" reload vimrc as soon as we're done editing it
autocmd! bufwritepost $MYVIMRC source $MYVIMRC


"-------------------------------------------------------------------- Filetypes
au BufRead,BufNewFile *.md set filetype=markdown


"-------------------------------------------------------------------- Command-T
let g:CommandTMaxHeight=20 "restrict the max height of buffer
"set flush
nmap <leader>f :CommandTFlush<cr>\|:CommandT<cr>

"----------------------------------------------------------------------- Colors
colorscheme solarized "use solarized color scheme

"
"set background=dark "use the dark solarized color scheme

" turn off the annoying top bar in MacVim
if has("gui_running")
 set guioptions=egmrt
endif
