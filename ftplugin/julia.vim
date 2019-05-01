nnoremap <buffer> <silent> <leader>r :call VimuxSendKeys("C-l")<cr>:VimuxRunCommand("include(\"" . expand("%:p") . "\")")<cr>
vnoremap <buffer> <silent> <leader>r :VimuxSendTextToTmux('<,'>)<cr>
