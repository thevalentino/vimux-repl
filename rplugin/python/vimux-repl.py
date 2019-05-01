import neovim

@neovim.plugin
class VimuxIPython(object):
    def __init__(self, vim):
        self.vim = vim

    def set_register(self, reg, value):
        self.vim.command("let @%s='%s'" % (reg, value.replace("'","''")))

    def find_first_non_empty_char(self, l):
        counter = 0
        while l[counter] == ' ':
            counter += 1
        return counter

    @neovim.command('VimuxSendTextToIpython', range='', nargs='*', sync=True)
    def send_selected_text_to_ipython(self, args, range):
        start, end = range
        buf = self.vim.current.buffer
        first_line = buf[start-1]
        first_non_empty_idx = self.find_first_non_empty_char(first_line)
        l = "\n".join([line[first_non_empty_idx:] for line in buf[start-1:end]])
        self.vim.funcs.setreg('+', l)
        selected_pane = self.vim.eval('g:VimuxRunnerIndex')
        msg = ("sending lines {} to {} "
               "to ipython in pane {}").format(start, end, selected_pane)
        self.vim.command(':echo "{}"'.format(msg))
        self.vim.command(':VimuxRunCommand("%paste")')
