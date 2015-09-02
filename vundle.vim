"vim:fdm=marker
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
Plugin 'closetag.vim' "Auto close tag
Plugin 'pangloss/vim-javascript' "Javascript syntax
Plugin 'Glench/Vim-Jinja2-Syntax' "Jinja syntax
Plugin 'mitsuhiko/vim-python-combined' "Python combined
Plugin 'mxw/vim-jsx' "React JSX syntax
Plugin 'Z1MM32M4N/vim-superman' "Super MAN

" [ CUSTOM CONFIG ]
" Tagbar - display functions
Plugin 'majutsushi/tagbar'
" F9 toggles tagbar
nnoremap <f9> :TagbarToggle<cr>

" MatchTagAlways - Highlight HTML tags {{{
" ================================================================
Plugin 'Valloric/MatchTagAlways'

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'mako' : 1,
    \}

" You complete me - completion
Plugin 'Valloric/YouCompleteMe'
"let g:ycm_min_num_of_chars_for_completion = 2
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_register_as_syntastic_checker = 0

" [ CUSTOM CONFIG ]
"
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
"let g:syntastic_python_checkers=['frosted']
let g:syntastic_javascript_checkers=['jsxhint']
let g:syntastic_sh_checkers=['sh']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open = 1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

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
