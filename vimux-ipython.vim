python << endpython
import neovim

def set_register(reg, value):
    vim.command("let @%s='%s'" % (reg, value.replace("'","''")))

def get_visual_selection():
    buf = vim.current.buffer
    starting_line_number, starting_column_number = buf.mark('<')
    ending_line_number, ending_column_number = buf.mark('>')
    lines = vim.eval('getline({}, {})'.format(starting_line_number, ending_line_number))
    return lines

def send_selected_text_to_tmux():
    l = "\n".join(get_visual_selection())
    set_register('+', l)
    vim.command(':call VimuxRunCommand("%paste\n", 0)')

def run_current_file_in_ipython():
    vim.command(':call VimuxRunCommand("%run {}")'.format(vim.current.buffer.name))

endpython

function! VimuxSetRunnerIndex(n)
    let g:VimuxRunnerIndex = a:n
endfunction

command! -nargs=* SetVimuxRunnerIndex :call SetVimuxRunnerIndex(<args>)
vmap <silent> <localleader>r :python send_to_tmux()<cr>
nmap <silent> <localleader>r :python run_current_file_in_ipython()<cr>
