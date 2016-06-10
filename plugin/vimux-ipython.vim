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

def find_first_non_empty_char(l):
    counter = 0
    while l[counter] == ' ':
        counter += 1
    return counter

def send_selected_text_to_tmux():
    lines = get_visual_selection()
    first = find_first_non_empty_char(lines[0])
    l = "\n".join([line[first:] for line in lines])
    set_register('+', l)
    vim.command(':call VimuxRunCommand("%paste\n", 0)')

def run_current_file_in_ipython():
    vim.command(':call VimuxRunCommand("%run {}")'.format(vim.current.buffer.name))

endpython

function! VimuxSetRunnerIndex(n)
    let g:VimuxRunnerIndex = a:n
endfunction

command! -nargs=* VimuxSetRunnerIndex :call VimuxSetRunnerIndex(<args>)
vnoremap <silent> <leader>r :python send_selected_text_to_tmux()<cr>
nnoremap <silent> <leader>r :python run_current_file_in_ipython()<cr>
