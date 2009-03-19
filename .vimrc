" Colorscheme
colo ir_black
set bg=light
syn on

" Periphery
set showcmd
set ruler
set wildmenu
set wildmode=list
set cursorline

" Tab settings
set softtabstop=4
set tabstop=8
set shiftwidth=4
set autoindent
set expandtab
set pastetoggle=<F2>

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" Filetypes
filetype plugin indent on
au bufwritepost .vimrc source % " auto-reload .vimrc on save

" Highlight unwanted spaces
hi Whitespace ctermbg=cyan
match Whitespace /\s\+$/ " match trailing spaces
let tab = matchadd("Whitespace", "\t", -1) " match tabs

" Mappings
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
" Block comments
vmap # :s/^/#/<CR>:noh<CR>

source ~/.vim/scripts/closetag.vim

