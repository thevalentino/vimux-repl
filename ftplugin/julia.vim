nnoremap <silent> <leader>r :VimuxRunCommand("include(\"" . expand("%:p") . "\")")<cr>
vnoremap <silent> <leader>r :VimuxSendTextToTmux('<,'>)<cr>
