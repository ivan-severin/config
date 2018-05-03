
" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off


" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

"A leader key
let mapleader = ";"

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" pathogen  .. needs by cscope
execute pathogen#infect()


call vundle#begin()
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" " CScope maps for kernel 
Plugin 'gnattishness/cscope_maps'

" " latex preview
Plugin 'xuhdev/vim-latex-live-preview'

" " colorscheme hybrid
Plugin 'w0ng/vim-hybrid'

" Airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" "filetype plugin on
let g:airline#extensions#tabline#enabled = 1

" Apply theme 
let g:airline_theme='minimalist'

let g:airline_powerline_fonts = 1

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

colorscheme hybrid

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Searching
" nnoremap / /\v
" vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" clear search
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim


" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
"set showmode
"set showcmd




" C/C++ configs

"80 characters line
autocmd FileType c,cpp  set colorcolumn=81
autocmd FileType c,cpp  execute "set colorcolumn=" . join(range(81,335), ',')
autocmd FileType c,cpp  highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Highlight trailing spaces
" " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
autocmd FileType c,cpp highlight ExtraWhitespace ctermbg=red guibg=red
autocmd FileType c,cpp match ExtraWhitespace /\s\+$/
autocmd FileType c,cpp autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd FileType c,cpp autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd FileType c,cpp autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd FileType c,cpp autocmd BufWinLeave * call clearmatches()

" Textmate holdouts
autocmd FileType c,cpp set tabstop=2
autocmd FileType c,cpp set softtabstop=2
autocmd FileType c,cpp set expandtab

" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!

" LATEX config 
" " update time
" " Pdf viewer 
autocmd Filetype tex setl updatetime=10000
autocmd Filetype tex let g:livepreview_previewer = 'open -a Preview'
autocmd Filetype tex map <leader>s :LLPStartPreview<CR>

