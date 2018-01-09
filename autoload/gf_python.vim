" Decide python version
if !exists("g:gf_python_prefer_python3")
    let g:gf_python_prefer_python3 = 1
endif

let s:has_supported_python = 0
if has('python3')
    if has('python') && !g:gf_python_prefer_python3
        let s:has_supported_python = 2
    else
        let s:has_supported_python = 3
    endif
elseif has('python')
    let s:has_supported_python = 2
endif

if !s:has_supported_python
    echoerr "Error: the gf_python.vim plugin requires Vim to be compiled with +python"
    finish
endif

" Initialize
function! s:GfInit()
    if !exists('g:loaded_gf_python')
        let s:plugin_path = escape(expand('<sfile>:p:h'), '\') . '/autoload'
        if s:has_supported_python == 3
            exe 'py3file ' . escape(s:plugin_path, ' ') . '/gf_python.py'
        else
            exe 'pyfile ' . escape(s:plugin_path, ' ') . '/gf_python.py'
        endif

        let g:loaded_gf_python = 1
    endif
endfunction

" Work functions
function gf_python#GoToFileNewTab()
    call s:GfInit()
    if s:has_supported_python == 3
        python3 goto_file_newtab()
    else
        python goto_file_newtab()
    endif
endfunction

function gf_python#GoToFileSame()
    call s:GfInit()
    if s:has_supported_python == 3
        python3 goto_file_same()
    else
        python goto_file_same()
    endif
endfunction

function gf_python#GoToFileVsplit()
    call s:GfInit()
    if s:has_supported_python == 3
        python3 goto_file_vsplit()
    else
        python goto_file_vsplit()
    endif
endfunction
