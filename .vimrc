""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Init.                                                                   {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=5             " enable modelines

" cd to the current file's directory
if exists("+autochdir")
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h
endif

" Jump to the last cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
                 \ | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Encoding                                                           {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8          " use UTF-8
set fileencodings=utf-8     " use UTF-8 for new files
set fileformats=unix,dos    " prefer UNIX line endings for new files


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text                                                                    {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab               " use spaces instead of tabs
set softtabstop=4           " 4 space tabs
set shiftwidth=4            " use 4 spaces for `<` or `>`
set shiftround              " use multiples of 4 for `<` or `>` indents
set tabstop=8               " 8 spaces for hard tabs
set backspace=2             " backspace over everything
set autoindent              " use the current indent for the next line
set smartindent             " use a "looser" cindent for indentation
set textwidth=78            " wrap at 78 chars
set virtualedit=all         " free-range cursor
set nostartofline           " keep the cursor in the same col for G,H,M,L,gg


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI                                                                      {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                   " syntax highlighting
set showcmd                 " show the command being typed
set ruler                   " show the line and column number (LINE,COL)
set wildmenu                " display a list of possible tab completions
set laststatus=2            " always show the status bar
set wildmode=list:longest,full   " match to the longest char, then use wildmenu
set cursorline              " highlight the active line
set confirm                 " ask instead of fail
set scrolloff=15            " always show 5 lines above and below cursor
set sidescroll=10           " show 10 cols for each horizontal move (L or J)
set vb t_vb=                " no bells (set again in gvimrc [it's stupid])
set list listchars=tab:▸\ ,trail:·,eol:¬    " » for tabs, · for trailing spaces
set listchars+=precedes:«,extends:»        " mark long lines


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching                                                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase              " case-insensitive searches
set smartcase               " unless an uppercase letter is detected
set incsearch               " show matches as they're being typed
set hlsearch                " highlight search results


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes                                                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType sh,ruby setlocal sts=2 sw=2 et


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                                {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" Remove trailing spaces
nmap <leader>D :exe '% s/\s\+$//e'<CR>

" Toggle spell-check
nmap <leader>v :setlocal spell! spelllang=en_us<CR>

" Toggle folds open or closed
nmap <Space> za

" Toggle tab type
nmap <leader><Tab> :call ToggleTab()<CR>

" Perform inline-calculations (e.g., type 2+2<C-a>)
ino <C-a> <C-o>yiW<End>=<C-r>=<C-r>0<CR>

nmap <leader>l :IndentGuidesToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations                                                           {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YYYY-MM-DD HH-MM TZ
iab isoD <C-R>=strftime('%Y-%m-%d %H:%m %z')<CR>

" vim: set foldmethod=marker:
