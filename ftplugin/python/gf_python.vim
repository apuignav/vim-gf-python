command! -nargs=0 GoToFileNewTab call gf_python#GoToFileNewTab()
command! -nargs=0 GoToFileSame call gf_python#GoToFileSame()
command! -nargs=0 GoToFileVsplit call gf_python#GoToFileVsplit()

nnoremap <buffer> gf :GoToFileNewTab<cr>
nnoremap <buffer> gff :GoToFileSame<cr>
nnoremap <buffer> gF :GoToFileVsplit<cr>

