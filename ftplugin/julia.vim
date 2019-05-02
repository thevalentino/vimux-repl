" For the following function to work properly, it is necessary to
" do the following in the Julia REPL:
" julia> Base.active_repl.options.auto_indent = false
" That line can also be added to the juliarc file.
"
function! VimuxSendTextToJuliaREPL() range
    let fulltext = join(getline(a:firstline, a:lastline), "\n") . "\n"
    call VimuxSendText(fulltext)
endfunction

nnoremap <buffer> <silent> <leader>R :call VimuxSendKeys("C-l")<cr>:VimuxRunCommand("include(\"" . expand("%:p") . "\")")<cr>
nnoremap <buffer> <silent> <leader>r :VimuxRunCommand("include(\"" . expand("%:p") . "\")")<cr>
nnoremap <buffer> <silent> <leader>K :call VimuxSendKeys("C-d")<cr>:call VimuxSendText("julia\n")<cr>
vnoremap <buffer> <silent> <leader>r :call VimuxSendTextToJuliaREPL()<cr>

