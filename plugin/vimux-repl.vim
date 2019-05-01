function! VimuxSetRunnerIndex(n)
    let g:VimuxRunnerIndex = a:n
endfunction

command! -nargs=* VimuxSetRunnerIndex :call VimuxSetRunnerIndex(<args>)
