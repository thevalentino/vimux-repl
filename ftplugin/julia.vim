nnoremap <buffer> <silent> <leader>r :VimuxRunCommand("include(\"" . expand("%:p") . "\")")<cr>
vnoremap <buffer> <silent> <leader>r :VimuxSendTextToTmux('<,'>)<cr>
