nnoremap <buffer> <silent> <leader>r :call VimuxSendKeys("C-l")<cr>:VimuxRunCommand("%run " . expand("%:p"))<cr>
vnoremap <buffer> <silent> <leader>r :VimuxSendTextToIpython('<,'>)<cr>
