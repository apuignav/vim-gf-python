import sys
import re
import glob
import os
import vim


def goto_file(command):
    sys.path.append(os.getcwd())
    cw = vim.eval('expand("<cfile>")')
    module = re.sub('\.', '/', cw)
    for p in sys.path:
        d = os.path.join(p, module)
        if os.path.isdir(d):
            f = os.path.join(d, '__init__.py')
            if os.path.isfile(f):
                vim.command('tabedit %s' % f)
                return
        g = os.path.join(p, '%s.py*' % module)
        for f in glob.iglob(g):
            vim.command('%s %s' % (command, f))
            return
    print >> sys.stderr, 'E447: Can\'t find file "%s" in python\'s sys.path' % cw

def goto_file_newtab():
    goto_file('tabedit')

def goto_file_same():
    goto_file('e')

def goto_file_vsplit():
    goto_file('vsplit')

