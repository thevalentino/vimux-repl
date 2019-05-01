function! VimuxSetRunnerIndex(n)
    let g:VimuxRunnerIndex = a:n
endfunction

command! -nargs=* VimuxSetRunnerIndex :call VimuxSetRunnerIndex(<args>)
nnoremap <silent> <leader>r :VimuxRunCommand("%run " . expand("%:p"))<cr>
vnoremap <silent> <leader>r :VimuxSendTextToTmux('<,'>)<cr>