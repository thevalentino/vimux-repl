nnoremap <buffer> <silent> <leader>r :VimuxRunCommand("%run " . expand("%:p"))<cr>
vnoremap <buffer> <silent> <leader>r :VimuxSendTextToTmux('<,'>)<cr>
