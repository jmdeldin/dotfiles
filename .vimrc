""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""
" Determines the OS
func! GetOS()
    if has('win32') || has('win64')
        return 'win'
    elseif has('unix')
        return (system('uname -a') =~? '^darwin') ? 'mac' : 'unix'
    endif
endfunc


""""""""""""""""""""""""""""""
" Init
""""""""""""""""""""""""""""""
let os = GetOS()
" Load closetag
runtime scripts/closetag.vim


""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""
colo ir_black
set bg=light
syn on


""""""""""""""""""""""""""""""
" Periphery
""""""""""""""""""""""""""""""
set showcmd
set ruler
set wildmenu
set wildmode=list
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


""""""""""""""""""""""""""""""
" Highlight unwanted spaces
""""""""""""""""""""""""""""""
hi Whitespace ctermbg=cyan guibg=cyan

" Highlight trailing spaces
match Whitespace /\s\+$/

" Highlight tabs
2match Whitespace /\t/

" Highlight lines longer than 78 chars
3match Whitespace /\%>78v.\+/


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
    vmap <leader>c :w !pbcopy<CR>
    nmap <leader>p :r !pbpaste<CR>
else
    vmap <leader>c "+y
    nmap <leader>p "+gP
endif

" Block comments
vmap # :s/^/#/<CR>:noh<CR>


""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""
" ISO timestamp
iab isoD <C-R>=strftime('%Y-%m-%d %H:%m %z')<CR>


""""""""""""""""""""""""""""""
" gVim options (Windows)
""""""""""""""""""""""""""""""
if os == 'win' && has("gui")
    set gfn=Lucida_Console:h9:cANSI
    " No toolbar
    set guioptions-=T
    " Sane backspace behavior
    set backspace=2
endif

