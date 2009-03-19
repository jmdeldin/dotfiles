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
map <leader>d :VSTreeExplore<CR>
map <leader>D :exe '% s/\s\+$//e'<CR> " rm trailing spaces
map <leader><Tab> :ToggleTab<CR>
map <leader>m :mak<CR><CR>
map <leader>s :w<CR>
map <leader>v :setlocal spell! spelllang=en_us<CR>
vmap # :s/^/#/<CR>:noh<CR> " block comment

source ~/.vim/scripts/closetag.vim

