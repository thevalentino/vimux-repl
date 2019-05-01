nnoremap <silent> <leader>r :VimuxRunCommand("%run " . expand("%:p"))<cr>
vnoremap <silent> <leader>r :VimuxSendTextToTmux('<,'>)<cr>
