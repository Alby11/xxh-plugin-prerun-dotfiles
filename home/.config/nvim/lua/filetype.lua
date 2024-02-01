vim.cmd([[
augroup filetypedetect
    au! BufRead,BufNewFile *.zpl setfiletype=zpl
augroup END
]])
