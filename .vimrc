" Encoding
set encoding=utf-8
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

call plug#begin('~/.vim/plugged')

"  plugin on GitHub repo
Plug 'airblade/vim-gitgutter'

" Git-diff tool
Plug 'jreybert/vimagit'

"  C++ additional syntax highlighting
" Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sheerun/vim-polyglot'

" Clang format code
Plug 'rhysd/vim-clang-format'

" Find usages for C/C++
Plug 'gnattishness/cscope_maps'

" Aosp files
Plug 'rubberduck203/aosp-vim'

" I3 syntax
Plug 'mboughaba/i3config.vim'

"  File Browsing
Plug 'scrooloose/nerdtree'

"  Python Auto-Indentation
Plug 'vim-scripts/indentpython.vim'

"  Sublime Text style multiple selections
Plug 'terryma/vim-multiple-cursors'

"  Comments
Plug 'tpope/vim-commentary'

" complete brackets, parentheses
Plug 'jiangmiao/auto-pairs'

" Aligning text with
Plug 'godlygeek/tabular'

" Plug 'triglav/vim-visual-increment'
Plug 'vim-scripts/VisIncr'
" Color scheme
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'rafi/awesome-vim-colorschemes'

" Buffer visible tabs
Plug 'ap/vim-buftabline'

call plug#end()

filetype plugin indent on    " required

" TURN OFF statusline
set laststatus=0

" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark

let g:gruvbox_contrast_light="hard"
colorscheme gruvbox
" colorscheme Tomorrow-Night
" colorscheme hybrid_material
" colorscheme jellybeans
" colorscheme apprentice

" Show line numbers
set number

" Blink cursor on error instead of beeping (grr)
set visualbell

" Visualize tabs and newlines
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Scroll limit
set scrolloff=5

" Copypaste
noremap <C-y> "+y
noremap <C-p> "+p

" black hole delete
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" new line without insert
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" clear search
map <leader><space> :let @/=''<cr> " clear search

" mouse scrolling
set mouse=a

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Git shortcuts
nmap Gp <Plug>GitGutterPreviewHunk
nmap Gs <Plug>GitGutterStageHunk
nmap Gu <Plug>GitGutterUndoHunk

nmap G] <Plug>GitGutterNextHunk
nmap G[ <Plug>GitGutterPrevHunk

" let magit interract with gutter
let g:magit_refresh_gitgutter=1

" Last line
set showmode
set showcmd

" Comment line (plugin)
inoremap <C-_> gc
vmap <C-_> v_gc
nmap <C-_> gc<Right>
imap <C-_> <C-o><C-_>

"  File browser
map <C-e> :NERDTreeToggle<CR>

" Autocpletion (some default stuff)
" for words
" " Remap code completion to Ctrl+Space
inoremap <Nul> <C-x><C-o>
inoremap <Nul> <C-n>

" Moving between tabs\buffers
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" move among buffers with CTRL
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>
map <C-d> :bd<CR>
" move among tabs with CTRL
nnoremap <C-t> :tabnew<cr>
nnoremap <C-h> :tabNext<cr>
nnoremap <C-l> :tabprevious<cr>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" use indentation of previous line
set autoindent

" use intelligent indentation
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

 " let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

autocmd Filetype gitcommit setlocal spell textwidth=80

autocmd Filetype xdefaults setlocal commentstring=!\ %s
autocmd Filetype vim set commentstring=\"\ %s
autocmd FileType h,hpp,c,cpp :call Cpp_config()
autocmd FileType python :call Python_config()
autocmd FileType make :call Make_config()
autocmd FileType java :call Java_config()

" For Android.mk's
function Make_config()
    " configure tabwidth and insert spaces instead of tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set textwidth=100
endfunction

" C/C++ configs
function Cpp_config()
    set colorcolumn=100
     " execute "set colorcolumn=" . join(range(81,335), ',')
    execute "set colorcolumn=" . join(range(100,335), ',')
    highlight ColorColumn ctermbg=Black ctermfg=DarkRed
    let g:cpp_member_variable_highlight = 0
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
    " Automatically deletes all tralling whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
    set nocompatible
    set autoindent
    set smartindent
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set number
    set showmatch
    setlocal commentstring=//\ %s
    setlocal spell
    set complete+=kspell
    " Clang formaet setting :TODO configure
    vnoremap <buffer><Leader>cf :ClangFormat<CR>
endfunction

"  Python config
function Python_config()
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set textwidth=79
    set expandtab
    set autoindent
    "  match BadWhitespace /\s\+$/
endfunction

"  Python config
function Java_config()
    set colorcolumn=100
     " execute "set colorcolumn=" . join(range(81,335), ',')
    execute "set colorcolumn=" . join(range(100,335), ',')
    highlight ColorColumn ctermbg=Black ctermfg=DarkRed
    let g:cpp_member_variable_highlight = 0
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
    set nocompatible
    set autoindent
    set smartindent
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    " set expandtab
    " set number
    " set showmatch
    setlocal commentstring=//\ %s
    setlocal spell
    " set complete+=kspell
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2
endfunction
