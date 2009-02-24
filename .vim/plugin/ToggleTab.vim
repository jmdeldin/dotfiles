" ToggleTab.vim:    Toggle soft and hard tabs
" Author:           Jon-Michael Deldin <dev@jmdeldin.com>

function! s:ToggleTab()
    if &expandtab
        set noexpandtab
    else
        set expandtab
    endif
endfun

command ToggleTab :call <SID>ToggleTab()

