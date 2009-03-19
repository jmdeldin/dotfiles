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

" Load closetag
runtime scripts/closetag.vim


""""""""""""""""""""""""""""""
" Highlight unwanted spaces
""""""""""""""""""""""""""""""
hi Whitespace ctermbg=cyan

" Highlight trailing spaces
match Whitespace /\s\+$/

" Highlight tabs
2match Whitespace /\t/

" Highlight lines longer than 78 chars
match Whitespace /\%>78v.\+/


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

" Saving
nmap <leader>s :w<CR>

" Toggle spell-check
nmap <leader>v :setlocal spell! spelllang=en_us<CR>

" System copy/paste (Mac)
vmap <leader>c :w !pbcopy<CR>
nmap <leader>p :r !pbpaste<CR>

" Block comments
vmap # :s/^/#/<CR>:noh<CR>

