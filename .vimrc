
" Don't try to be vi compatible
" set nocompatible

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
" call vundle#begin('~/some/path/here')

"  let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"  plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

"  CScope maps for kernel
Plugin 'gnattishness/cscope_maps'

"  File Browsing
Plugin 'scrooloose/nerdtree'

"  Python Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

"  Python Auto-Complete
Plugin 'Valloric/YouCompleteMe'

"  Sublime Text style multiple selections
Plugin 'terryma/vim-multiple-cursors'

"  Comments
Plugin 'tpope/vim-commentary'

"  Folding big classes
Plugin 'tmhedberg/SimpylFold'

"  latex preview
Plugin 'xuhdev/vim-latex-live-preview'

"  colorscheme hybrid
Plugin 'w0ng/vim-hybrid'

" Airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
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

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1


" move among buffers with CTRL
map <C-L> :bnext<CR>
map <C-K> :bprev<CR>
map <C-J> :bd<CR>
" C-T for new tab
nnoremap <C-t> :tabnew<cr>

" Navigating with guides
inoremap <C-S-_> <Esc>/<++><Enter>"_c4l
vnoremap <C-S-_> <Esc>/<++><Enter>"_c4l
map <C-S-_> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

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


" Comment line (plugin)
inoremap <C-_> gc
vnoremap <C-_> v_gc
map <C-_> gc}
" map <C-_><Sift>  gc}

"  File browser
map <C-o> :NERDTreeToggle<CR>


" vim-multiple-cursors
" let g:multi_cursor_use_default_mapping=0

" Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'


" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e



" C/C++ configs

"80 characters line
autocmd FileType c,cpp  set colorcolumn=81
autocmd FileType c,cpp  execute "set colorcolumn=" . join(range(81,335), ',')
autocmd FileType c,cpp  highlight ColorColumn ctermbg=Black ctermfg=DarkRed

" Highlight trailing spaces
"  http://vim.wikia.com/wiki/Highlight_unwanted_spaces
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

" LATEX config
autocmd Filetype tex setl updatetime=10000
autocmd Filetype tex let g:livepreview_previewer = 'open -a Preview'
autocmd Filetype tex map <leader>s :LLPStartPreview<CR>
autocmd FileType tex setlocal commentstring=%\ %s


autocmd FileType tex inoremap <leader>fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <leader>em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap <leader>bf \textbf{}<++><Esc>T{i
autocmd FileType tex vnoremap <leader> <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
autocmd FileType tex inoremap <leader>it \textit{}<++><Esc>T{i

autocmd FileType tex inoremap <leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <leader>li <Enter>\item<Space>

autocmd FileType tex inoremap <leader>ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap <leader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap <leader>sc \textsc{}<Space><++><Esc>T{i

autocmd FileType tex inoremap <leader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>st <Esc>F{i*<Esc>f}i

autocmd FileType tex inoremap <leader>beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap <leader>up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap <leader>up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap <leader>tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <leader>bt {\blindtext}
autocmd FileType tex inoremap <leader>nu $\varnothing$
autocmd FileType tex inoremap <leader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap <leader>rn (\ref{})<++><Esc>F}i
autocmd FileType tex inoremap <leader>ci (\cite{})<++><Esc>F}i

autocmd FileType tex inoremap <leader>ent (\entry{<++>}{<++>}{<++>}<Enter>{<++>}<Enter>{<++>}{<++>})<Enter><Enter><++><Esc>/<++><Enter>"_c4l

autocmd FileType tex inoremap <leader>m $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap <leader>M $$$$<Enter><Enter><++><Esc>2k$hi

"  Python config
autocmd FileType python set tabstop=4
                      \ set softtabstop=4
                      \ set shiftwidth=4
                      \ set textwidth=79
                      \ set expandtab
                      \ set autoindent
                      \ set fileformat=unix

autocmd FileType python match BadWhitespace /\s\+$/
autocmd FileType python let g:ycm_autoclose_preview_window_after_completion=1
autocmd FileType python map <leader>space  :YcmCompleter GoToDefinitionElseDeclaration<CR>
