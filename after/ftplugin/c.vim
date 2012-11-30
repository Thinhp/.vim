" Disable auto comment for //
setlocal comments-=://
setlocal comments+=f://

" Compile and run current file
nnoremap <Leader>r :w<CR>:!gcc<Space>-Wall<Space>-ansi<Space>-pedantic<Space>%<Space>-o<Space>%:r<Space>&&<Space>./%:r<CR>

"Change gcc alias"
nnoremap <F4> :!gcc -Wall -ansi -pedantic


" Ask user which files to compile (separated by spaces)
nnoremap <F5> :w<CR>:call ThinhpCompileSpecific()<CR>
function! ThinhpCompileSpecific()
    call inputsave()
    let cfiles = input("Which files: ")
    let outfiles = input("Output file: ")
    call inputrestore()
    execute '!gcc -Wall -ansi -pedantic ' . cfiles . ' -o ' . outfiles . ' && ./' . outfiles
    return 0
endfunction
