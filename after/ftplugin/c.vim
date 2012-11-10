" Disable auto comment for //
setlocal comments-=://
setlocal comments+=f://

" Compile and run current file
nnoremap <Leader>r :w<CR>:!gcc<Space>%<Space>-o<Space>%:r<Space>&&<Space>./%:r<CR>
