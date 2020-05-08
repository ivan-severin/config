set encoding=utf-8
set nocompatible
filetype plugin indent on
syntax on
let mapleader = ";"
set modelines=0

call plug#begin('~/.vim/plugged')
" Git:
    Plug 'airblade/vim-gitgutter'
    Plug 'jreybert/vimagit'
    Plug 'zivyangll/git-blame.vim'
" Code:
    Plug 'sheerun/vim-polyglot'
    Plug 'rhysd/vim-clang-format'
    Plug 'gnattishness/cscope_maps'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'rubberduck203/aosp-vim'
    Plug 'mboughaba/i3config.vim'
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs'
" Files:
    Plug 'scrooloose/nerdtree'
    Plug 'srstevenson/vim-picker'
" Text:
    Plug 'terryma/vim-multiple-cursors'
    Plug 'godlygeek/tabular'
    Plug 'vim-scripts/visincr'
" Design:
    Plug 'morhetz/gruvbox'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'ap/vim-buftabline'
" Test:
call plug#end()

" TURN OFF statusline
set laststatus=0

" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.

let g:gruvbox_contrast_light="hard"
colorscheme gruvbox

" Blink cursor on error instead of beeping (grr)
set visualbell
set belloff=all

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
nmap Gp <Plug>(GitGutterPreviewHunk)
nmap Gs <Plug>(GitGutterStageHunk)
nmap Gu <Plug>(GitGutterUndoHunk)

nmap G] <Plug>(GitGutterNextHunk)
nmap G[ <Plug>(GitGutterPrevHunk)
let g:magit_refresh_gitgutter=1

" Git Blame 
nnoremap <leader>s :<C-u>call gitblame#echo()<CR>

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

" Moving between tabs\buffers
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" move among buffers with CTRL
map <C-j> :bnext<CR>
map <C-k> :bprev<CR>
map <C-d> :bd<CR>

" vim-multiple-cursors
let g:multi_cursor_use_default_mapping=1

" Fuzzy finder
nmap <unique> <leader>fe <Plug>(PickerEdit)
nmap <unique> <leader>fs <Plug>(PickerSplit)
nmap <unique> <leader>ft <Plug>(PickerTabedit)
nmap <unique> <leader>fv <Plug>(PickerVsplit)
nmap <unique> <leader>fb <Plug>(PickerBuffer)
nmap <unique> <leader>f] <Plug>(PickerTag)
nmap <unique> <leader>fw <Plug>(PickerStag)
nmap <unique> <leader>fo <Plug>(PickerBufferTag)
nmap <unique> <leader>fh <Plug>(PickerHelp)
"
" use indentation of previous line
set autoindent

" use intelligent indentation
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

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
endfunction

"  Java config
function Java_config()
    set colorcolumn=100
    execute "set colorcolumn=" . join(range(100,335), ',')
    highlight ColorColumn ctermbg=Black ctermfg=DarkRed
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
    set number
    " set showmatch
    setlocal commentstring=//\ %s
    setlocal spell
    " set complete+=kspell
    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2
endfunction

function! UpdateCscopeDb()
    let extensions = [ "\"*.cpp\"", "\"*.h\"", "\"*.hpp\"", "\"*.inl\"", "\"*.c\"", "\"*.java\"" ]
    let update_file_list = "find . -name " . join(extensions, " -o -name ") . " > ./cscope.files"
    echo update_file_list
    echo system(update_file_list)
    echo system("cscope -b")
    cscope kill 0
    cscope add .
endfunction

nmap <F12> :call UpdateCscopeDb()<cr>
vmap <F12> <esc>:call UpdateCscopeDb()<cr>
imap <F12> <esc>:call UpdateCscopeDb()<cr>
