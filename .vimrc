""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""
" Determines the OS
func! GetOS()
    if has('win32') || has('win64')
        return 'win'
    elseif has('unix')
        return (system('uname') =~ 'Darwin') ? 'mac' : 'unix'
    endif
endfunc


""""""""""""""""""""""""""""""
" Init
""""""""""""""""""""""""""""""
let os = GetOS()

" Load closetag
runtime scripts/closetag.vim

" OS X dist. disables modelines by default
set modelines=5

" Jump to the last known cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""
if $TERM == 'xterm-256color'
    set t_Co=256
    colo zenburn
endif
syn on


""""""""""""""""""""""""""""""
" Periphery
""""""""""""""""""""""""""""""
set showcmd
set ruler
set wildmenu
set wildmode=list:longest
set cursorline


""""""""""""""""""""""""""""""
" Text settings
""""""""""""""""""""""""""""""
set textwidth=78
set softtabstop=4
set tabstop=8
set shiftwidth=4
set autoindent
set expandtab


""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
set hlsearch


""""""""""""""""""""""""""""""
" Filetypes & scripts
""""""""""""""""""""""""""""""
filetype plugin indent on

" Auto-reload .vimrc on save
au bufwritepost $MYVIMRC source %

" Tasklist plugin
let g:tlTokenList = ['FIXME', 'TODO', 'CHANGED', 'DONE']


""""""""""""""""""""""""""""""
" Highlight-patterns
""""""""""""""""""""""""""""""
hi Whitespace ctermbg=cyan guibg=cyan

" Highlight trailing spaces
match Whitespace /\s\+$/

" Highlight tabs
2match Whitespace /\t/

" Highlight lines longer than 78 chars
3match Whitespace /\%>78v.\+/

au BufWinEnter * let todo    = matchadd('Search', 'TODO', -1)
au BufWinEnter * let fixme   = matchadd('Error', 'FIXME', -1)
au BufWinEnter * let changed = matchadd('Label', 'CHANGED', -1)
au BufWinEnter * let done    = matchadd('Label', 'DONE', -1)


""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""
" Open VSTreeExplore
nmap <leader>d :VSTreeExplore<CR>

" Remove trailing spaces
nmap <leader>D :exe '% s/\s\+$//e'<CR>

" Toggle soft and hard tabs
nmap <leader><Tab> :ToggleTab<CR>

" Make
nmap <leader>m :mak<CR><CR>

" Rake
nmap <leader>r :!rake<CR><CR>

" Saving
nmap <leader>s :w<CR>

" Toggle spell-check
nmap <leader>v :setlocal spell! spelllang=en_us<CR>

" System copy/paste
if os == 'mac'
    vmap <leader>y :w !pbcopy<CR>
    nmap <leader>p :r !pbpaste<CR>
else
    vmap <leader>y "+y
    nmap <leader>p "+gP
endif

" Block comments
vmap # :s/^/#/<CR>:noh<CR>


""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""
" ISO timestamp
iab isoD <C-R>=strftime('%Y-%m-%d %H:%m %z')<CR>

" @author
iab jmauth Jon-Michael Deldin <dev@jmdeldin.com>


""""""""""""""""""""""""""""""
" gVim
""""""""""""""""""""""""""""""
if has('gui_running')
    colo oceandeep
    " No toolbar
    set guioptions-=T
    " No bells
    set vb t_vb=
    if os == 'win'
        " Sane backspace behavior
        set backspace=2
        set gfn=Lucida_Console:h9:cANSI
    elseif os == 'mac'
        set fuoptions=maxvert,maxhorz
    endif
endif

