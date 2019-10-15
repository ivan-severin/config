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
" test:
    " Plug 'ludovicchabant/vim-gutentags'
    " Plug 'skywind3000/gutentags_plus'
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

" let g:gruvbox_contrast_light="hard"
colorscheme gruvbox
" colorscheme hybrid_material

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

" Mapping of multicursor
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

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
let g:picker_custom_find_flags = '--color always --files'
let g:picker_height = 20

" let g:gutentags_plus_nomap = 1
" noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" " config project root markers.
" let g:gutentags_project_root = ['.git']

" enable gtags module
" let g:gutentags_modules = ['gtags']
" let g:gutentags_gtags_executable = 'ctags'
" generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1

" let g:gutentags_define_advanced_commands = 1

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
    "  match BadWhitespace /\s\+$/
endfunction
