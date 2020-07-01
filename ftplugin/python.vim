nnoremap <buffer> <silent> <leader>R :call VimuxSendKeys("C-l")<cr>:VimuxRunCommand("%run " . expand("%:p"))<cr>
nnoremap <buffer> <silent> <leader>r :VimuxRunCommand('%run "' . expand("%:p") . '"')<cr>
vnoremap <buffer> <silent> <leader>r :VimuxSendTextToIpython('<,'>)<cr>
