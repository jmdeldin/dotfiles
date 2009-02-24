" ack.vim: Replace grep with Ack
" Author:  Antoine Imbert
" URI:     <http://blog.ant0ine.com/2007/03/ack_and_vim_integration.html>

function! s:Ack(args)
    let grepprg_bak=&grepprg
    set grepprg=ack\ -H\ --nocolor\ --nogroup
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
endfunction

command! -nargs=* -complete=file Ack call s:Ack(<q-args>)

