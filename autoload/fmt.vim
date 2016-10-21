" fmt.vim: Vim command to format .go files with crlfmt.

if !exists('g:crlfmt_fail_silently')
    let g:crlfmt_fail_silently = 0
endif

if !exists('g:crlfmt_options')
    let g:crlfmt_options = ' -ignore ".*.pb(.gw)?.go" -tab 2'
endif

" Below function is copied from vim-go's fmt.vim file.
function! fmt#Format()
    if !(expand('%:p:h')=~#"cockroachdb")
        return
    endif

    if !executable("crlfmt")
        echo "crlfmt: could not find crlfmt. Please install it from github.com/cockroachdb/crlfmt"
        return ""
    endif

    " save cursor position and many other things
    let l:curw=winsaveview()

    " Write current unsaved buffer to a temp file
    let l:tmpname = tempname() . ".go"
    call writefile(getline(1, '$'), l:tmpname)

    let fmt_command = "crlfmt"

    " populate the final command with user based fmt options
    let command = fmt_command . ' -w ' . g:crlfmt_options

    " execute our command...
    let out = system(command . " " . l:tmpname)

    " if there is no error on the temp file replace the output with the
    " current file.
    if v:shell_error == 0
        " remove undo point caused via BufWritePre
        try | silent undojoin | catch | endtry

        " Replace current file with temp file, then reload buffer
        call rename(l:tmpname, expand('%'))
        silent edit!
        let &syntax = &syntax
    elseif g:crlfmt_fail_silently == 0
        echo out
        " We didn't use the temp file, so clean up
        call delete(l:tmpname)
    endif

    " restore our cursor/windows positions
    call winrestview(l:curw)
endfunction


" vim:ts=4:sw=4:et
