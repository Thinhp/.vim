" vim:fdm=marker
filetype off "required*
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manages itself
Plugin 'gmarik/vundle'

" ============
" My Plugins ||
" ============

" [ NO CONFIGURATION ]
Plugin 'tpope/vim-surround' "All 'surrounding' : parentheses, brackets, quotes...etc
Plugin 'beloglazov/vim-online-thesaurus' "Thesaurus
Plugin 'tpope/vim-fugitive' "Git things - no config yet
Plugin 'chase/vim-ansible-yaml' "Ansible stuffs
Plugin 'scrooloose/nerdcommenter.git' "Easy comment
Plugin 'kien/ctrlp.vim' "Help controlling files better
Plugin 'kien/rainbow_parentheses.vim' "Make parentheses rainbow

" [ CUSTOM CONFIG ]
" Vim-gitgutter - Provides modified git info for airline
" ======================================================
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_signs = 0

" Airline 
" ======================================================
Plugin 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'
set laststatus=2

" Fix slow mode switch issue
if ! has('gui_running')
    set ttimeoutlen=10
endif

" Mark down - syntax highlighting for filetype plugin
" ======================================================
Plugin 'tpope/vim-markdown' " Syntax highlighting for fenced code blocks.
let g:markdown_fenced_languages = ['javascript', 'js=javascript',
             \'json=javascript', 'python', 'bash=sh', 'zsh=sh']

" Syntastic - checking syntax
Plugin 'scrooloose/syntastic'
let g:syntastic_python_checkers=['frosted']
let g:syntastic_javascript_checkers=['jsxhint']
let g:syntastic_sh_checkers=['sh']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 1

" delimitMate - Auto bracket 
" ================================================================
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1

" Nerdtree
" ========================================================
Plugin 'scrooloose/nerdtree'
" Auto quit NERDTree if it's the only buffer left
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
        if bufwinnr(t:NERDTreeBufName) != -1
            if winnr("$") == 1
                q
            endif
        endif
    endif
endfunction"

nnoremap <F8> :NERDTreeToggle<CR>

call vundle#end()

"set filetype on again
filetype plugin indent on "required!
