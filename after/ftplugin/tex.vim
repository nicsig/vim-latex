augroup my_tex
    au! * <buffer>
    au BufWinEnter <buffer>  setl cocu=nc
                         \|  setl cole=3
                         \|  setl fdm=marker
                         \|  setl fdt=fold#text()
augroup END

nmap  <buffer><nowait><silent>  <bslash>C  <plug>(vimtex-compile)
nmap  <buffer><nowait><silent>  <bslash>c  <plug>(vimtex-compile-ss)
nmap  <buffer><nowait><silent>  <bslash>n  <plug>(vimtex-clean)
nmap  <buffer><nowait><silent>  <bslash>N  <plug>(vimtex-clean-full)
nmap  <buffer><nowait><silent>  <bslash>S  <plug>(vimtex-stop-all)
nmap  <buffer><nowait><silent>  <bslash>s  <plug>(vimtex-stop)
nmap  <buffer><nowait><silent>  <bslash>v  <plug>(vimtex-view)

let b:mc_chain = [
\    'omni',
\    'ulti',
\    'keyp',
\ ]

" teardown {{{1

let b:undo_ftplugin =         get(b:, 'undo_ftplugin', '')
\                     .(empty(get(b:, 'undo_ftplugin', '')) ? '' : '|')
\                     ."
\                        setl cocu< cole< fdm< fdt<
\                      | unlet! b:mc_chain
\                      | exe 'au! my_tex * <buffer>'
\                      | exe 'nunmap <buffer> <bslash>c'
\                      | exe 'nunmap <buffer> <bslash>C'
\                      | exe 'nunmap <buffer> <bslash>n'
\                      | exe 'nunmap <buffer> <bslash>N'
\                      | exe 'nunmap <buffer> <bslash>s'
\                      | exe 'nunmap <buffer> <bslash>S'
\                      | exe 'nunmap <buffer> <bslash>v'
\                      "
