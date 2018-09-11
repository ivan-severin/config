
" Don't try to be vi compatible
set nocompatible


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

"  let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"  plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

"  gitdiff tool
Plugin 'jreybert/vimagit'

"  C++ additional syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" Helpers for C and C++
" Plugin 'luchermitte/lh-cpp' (doesnt work)

"  CScope maps for kernel
"  Plugin 'gnattishness/cscope_maps'

"  File Browsing
Plugin 'scrooloose/nerdtree'

"  Python Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

"  Python Auto-Complete
" Plugin 'Valloric/YouCompleteMe'
Plugin 'justmao945/vim-clang.git'

"  Sublime Text style multiple selections
Plugin 'terryma/vim-multiple-cursors'

"  Comments
Plugin 'tpope/vim-commentary'

"  Folding big classes
Plugin 'tmhedberg/SimpylFold'

"  latex preview
" Plugin 'xuhdev/vim-latex-live-preview'

" Colorscheme pack
Plugin 'rafi/awesome-vim-colorschemes'

" Airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


call vundle#end()            " required


filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Enable tabs
let g:airline#extensions#tabline#enabled = 1

" turnoff statusline
set laststatus=0

" Apply theme
" let g:airline_theme='minimalist'
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1


" Visualize tabs and newlines
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1


" Colorscheme pack:

" colorscheme sidonia
" colorscheme afterglow
" colorscheme alduin
" colorscheme anderson
" colorscheme angr
" colorscheme apprentice
" colorscheme archery
" colorscheme atom
" colorscheme carbonized-dark
" colorscheme carbonized-light
" colorscheme challenger_deep
" colorscheme deep-space
" colorscheme deus
" colorscheme dracula
" colorscheme flattened_dark
" colorscheme flattened_light
" colorscheme focuspoint
" colorscheme github
" colorscheme gotham256
" colorscheme gotham
" colorscheme gruvbox
" colorscheme happy_hacking
colorscheme hybrid_material
" colorscheme hybrid_reverse
" colorscheme hybrid
" colorscheme iceberg
" colorscheme jellybeans
" colorscheme lightning
" colorscheme lucid
" colorscheme lucius
" colorscheme materialbox
" colorscheme meta5
" colorscheme minimalist
" colorscheme molokai
" colorscheme molokayo
" colorscheme nord
" colorscheme OceanicNextLight
" colorscheme OceanicNext
" colorscheme onedark
" colorscheme one
" colorscheme orange-moon
" colorscheme orbital
" colorscheme PaperColor
" colorscheme paramount
" colorscheme parsec
" colorscheme pink-moon
" colorscheme pyte
" colorscheme rakr
" colorscheme rdark-terminal2
" colorscheme scheakur
" colorscheme seoul256-light
" colorscheme seoul256
" colorscheme sierra
" colorscheme solarized8_flat
" colorscheme solarized8_high
" colorscheme solarized8_low
" colorscheme solarized8
" colorscheme space-vim-dark
" colorscheme tender
" colorscheme termschool
" colorscheme twilight256
" colorscheme two-firewatch
" colorscheme wombat256mod
" colorscheme yellow-moon

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

" Copypaste
noremap <C-y> "+y
noremap <C-p> "+p

" clear search
map <leader><space> :let @/=''<cr> " clear search

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <leader>f za
let g:SimpylFold_docstring_preview=1


" move among buffers with CTRL
map <C-L> :bnext<CR>
map <C-K> :bprev<CR>
map <C-J> :bd<CR>
nnoremap <C-t> :tabnew<cr>


" Cursor motion
" set scrolloff=3
" set backspace=indent,eol,start
" set matchpairs+=<:> " use % to jump between pairs
" runtime! macros/matchit.vim


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
set showmode
set showcmd


" Comment line (plugin)
inoremap <C-_> gc
vnoremap <C-_> v_gc
map <C-_> gc<Right>

" inoremap <S-> gc
" vnoremap <S-?> v_gc
" map <C-\>> gc<Right>


"  File browser
map <C-e> :NERDTreeToggle<CR>

" Autocpletion (some default stuff)
" for words
" " Remap code completion to Ctrl+Space {{{2
inoremap <Nul> <C-x><C-o>
inoremap <Nul> <C-n>
" for files
" inoremap <S-Space> <C-f>

" vim-multiple-cursors
" let g:multi_cursor_use_default_mapping=0

" " Default mapping
" let g:multi_cursor_start_word_key      = '<C-n>'
" let g:multi_cursor_select_all_word_key = '<A-n>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
" let g:multi_cursor_next_key            = '<C-n>'
" let g:multi_cursor_prev_key            = '<C-p>'
" let g:multi_cursor_skip_key            = '<C-x>'
" let g:multi_cursor_quit_key            = '<Esc>'

" use indentation of previous line
set autoindent

" use intelligent indentation
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

 let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

autocmd Filetype gitcommit setlocal spell textwidth=80
autocmd Filetype tex :call Latex_config()
autocmd FileType h,hpp,c,cpp :call Cpp_config()
autocmd FileType python :call Python_config()
autocmd FileType make :call Make_config()

" For Android.mk's
:function Make_config()
:  " configure tabwidth and insert spaces instead of tabs
:  set tabstop=4
:  set softtabstop=4
:  set shiftwidth=4
:  set expandtab
:  set textwidth=100
:endfunction

" C/C++ configs
:function Cpp_config()
:
:  "80 characters line
:  set colorcolumn=100
:  " execute "set colorcolumn=" . join(range(81,335), ',')
:  execute "set colorcolumn=" . join(range(100,335), ',')
:  highlight ColorColumn ctermbg=Black ctermfg=DarkRed
:  let g:cpp_member_variable_highlight = 0
:
:  " Highlight trailing spaces
:  highlight ExtraWhitespace ctermbg=red guibg=red
:  match ExtraWhitespace /\s\+$/
:  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
:  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
:  autocmd BufWinLeave * call clearmatches()
:
:
:  " disable vi compatibility (emulation of old bugs)
:  set nocompatible
:
:  " use indentation of previous line
:  set autoindent
:
:  " use intelligent indentation for C
:  set smartindent
:
:  " configure tabwidth and insert spaces instead of tabs
:  set tabstop=4
:  set softtabstop=4
:  set shiftwidth=4
:  set expandtab
:  set textwidth=100
:
:  " wrap lines at 120 chars. 80 is somewaht antiquated with nowadays displays.
:  " set textwidth=120
:  " turn syntax highlighting on
:  " turn line numbers on
:  set number
:
:  " highlight matching braces
:  set showmatch
:  " intelligent comments
:  setlocal commentstring=//\ %s
:  let g:clang_c_options = '-std=gnu11'
:  let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
:  let g:clang_compilation_database = '~/dev/env/'
:  " set comments=sl:/*,mb:\ *,elx:\ */
:endfunction


" LATEX config
:function Latex_config()
:  setl updatetime=10000
:  let g:livepreview_previewer = 'open -a Preview'
:  map <leader>s :LLPStartPreview<CR>
:  setlocal commentstring=%\ %s
:
:
:  inoremap <leader>fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
:  inoremap <leader>em \emph{}<++><Esc>T{i
:  inoremap <leader>bf \textbf{}<++><Esc>T{i
:  vnoremap <leader> <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
:  inoremap <leader>it \textit{}<++><Esc>T{i
:
:  inoremap <leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
:  inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
:  inoremap <leader>li <Enter>\item<Space>
:
:  inoremap <leader>ref \ref{}<Space><++><Esc>T{i
:  inoremap <leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
:  inoremap <leader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
:  inoremap <leader>sc \textsc{}<Space><++><Esc>T{i
:
:  inoremap <leader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
:  inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
:  inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
:  inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
:  inoremap <leader>st <Esc>F{i*<Esc>f}i
:
:  inoremap <leader>beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
:  inoremap <leader>up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
:  nnoremap <leader>up /usepackage<Enter>o\usepackage{}<Esc>i
:  inoremap <leader>tt \texttt{}<Space><++><Esc>T{i
:  inoremap <leader>bt {\blindtext}
:  inoremap <leader>nu $\varnothing$
:  inoremap <leader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
:  inoremap <leader>rn (\ref{})<++><Esc>F}i
:  inoremap <leader>ci (\cite{})<++><Esc>F}i
:
:  inoremap <leader>ent (\entry{<++>}{<++>}{<++>}<Enter>{<++>}<Enter>{<++>}{<++>})<Enter><Enter><++><Esc>/<++><Enter>"_c4l
:
:  inoremap <leader>m $$<Space><++><Esc>2T$i
:  inoremap <leader>M $$$$<Enter><Enter><++><Esc>2k$hi
:endfunction


"  Python config
:function Python_config()
:  set tabstop=4
:  set softtabstop=4
:  set shiftwidth=4
:  set textwidth=79
:  set expandtab
:  set autoindent
:  set fileformat=unix
:  "  match BadWhitespace /\s\+$/
:  let g:ycm_autoclose_preview_window_after_completion=1
:  map <leader>space  :YcmCompleter GoToDefinitionElseDeclaration<CR>
:endfunction

