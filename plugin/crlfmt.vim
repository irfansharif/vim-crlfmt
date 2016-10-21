if get(g:, "crlfmt_autosave", 1)
    autocmd BufWritePre *.go call fmt#Format()
endif

command! -nargs=0 CrlFmt call fmt#Format()


" vim:ts=4:sw=4:et
