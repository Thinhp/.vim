"Filename : Vimrc
"Author: TanThinh

"======================== USING PATHOGEN (NOT NOW )===================
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
"call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

"======================== USING VUNDLE =====================
so $HOME/.vim/vundle.vim


"=============== END KEY SETTINGS ==================================

"Always load syntax on"
syntax on

"set lines=55 columns=130 "Default size
set nocompatible	"Use Vim Settings, rather than Vi settings
set smartindent		"Settings for smart indentation
set autoindent 		"Settings for auto indentation
set copyindent		"Copy previous indentation on autoindentating
set showmatch		"Set show matching parenthesis
set ignorecase 		"Set ignore cases when searching 
set smartcase		"Ignore case if all lowercase --> Else Case sensitive 
set smarttab		"Insert tabs-start of a line by shiftwidth, not tabstop
set hlsearch		"Highlight search terms
set incsearch		"Show search matches as we type
set cindent		"Settings for c indent
set expandtab		"Use softtabstop spaces instead of tab for indentation
set number		"Set line numbers
set relativenumber      "Set relative
set numberwidth=3       "Set width line number
set shiftwidth=4	"Indent by 4 spaces when pressing >>, <<, ==
set shiftround		"Use multiple of shiftwidth when indenting < or >
set softtabstop=4	" indent by 4 spaces when pressing TAB
set history=1000	"remember more commands and search history
set undolevels=1000	"Use many muchos levels of undo
set wildignore =*.swp,*.bak,*.pyc,*.class
set title		"Change terminal title
" set colorcolumn=80	"80-character indicator line
set clipboard=unnamedplus "copy-paste in a same way ( same clipboard as system)

"Set colorscheme 
if (has('gui_running'))
    colorscheme clearance
    se t_Co=256
else
    colorscheme grb256
    se t_Co=256
endif

"Set backspace 
set backspace=indent,eol,start

"Always enable Powerline
set laststatus=2    "Always show status line
set encoding=utf-8  "	show Unicode glyphs

" Do not keep backup files
"set nobackup
"set nowritebackup
"set noswapfile

" Keep backup files"
set backupdir=~/tmp
set directory=~/tmp

" Auto change working directory to current file's
set autochdir

" Auto reload file on change
set autoread

"Let NerdTree edit file system"
set modifiable

" Fix powerline slow mode switch issue
if (!has('gui_running'))
	set ttimeoutlen=0
endif

" Uncomment if using MACVIM to be able to use clipboard
set clipboard=unnamed

"Auto call NerdTree when start-up
"autocmd VimEnter * NERDTree

"Auto quit both NerdTree and Tagbar
"autocmd WinEnter * call s:CloseNerdTreeTagBar()
"function! s:CloseNerdTreeTagBar()
"    let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
"    let tagbar_open = bufwinnr('__Tagbar__') != -1
"
"  if exists("t:NERDTreeBufName")
"    if nerdtree_open && tagbar_open
"      if winnr("$") == 2 || winnr("$") == 1
"        NERDTreeClose
"        TagbarClose
"      endif
"    endif
"  endif
"endfunction

"Auto enter Tagbar when start up"
"autocmd VimEnter * TagbarOpen

" Move current tab into the specified direction.
" @param direction -1 for left, 1 for right.
function! TabMove(direction)
    " get number of tab pages.
    let ntp=tabpagenr("$")
    " move tab, if necessary.
    if ntp > 1
        " get number of current tab page.
        let ctpn=tabpagenr()
        " move left.
        if a:direction < 0
            let index=((ctpn-1+ntp-1)%ntp)
        else
            let index=(ctpn%ntp)
        endif

        " move tab page.
        execute "tabmove ".index
    endif
endfunction

function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

" Move vim split screen
function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

" Rainbow parenthese always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"================== CHANGES PRESSING KEYS ===============================
"Promp Vim hotkey helpfile
nnoremap <F12> :!less ~/.vim/helpcommand 

" ';' can be used as ':'
nnoremap ; :

"Easier block indenting (does not exit visual mode after once)
vnoremap < <gv
vnoremap > >gv

"Change search and replace settins
nnoremap <Leader>sr :%s/

"Write force files with sudo permission
command WriteForce w<Space>!sudo<Space>tee<Space>%
nnoremap <Leader>wf :WriteForce<CR>

"Map switching tab for NERDTREE"
nnoremap <Tab> <C-w>w

"Toggle some plugins"
nnoremap <F8> :NERDTreeToggle<CR>
nnoremap <F9> :TagbarToggle<CR>

"Change Tab key and next,previous tab to Ctrl t,[,]"
nnoremap <A-t> :tabe 
nnoremap <c-t> :tabe 
nnoremap <A-b> gT
nnoremap <A-n> gt
nnoremap <C-b> gT
nnoremap <C-n> gt

"Remap jump up and down text, left right to at the edge"
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap <C-h> _
nnoremap <C-l> $

"Move tab left or right
nnoremap <S-b> :call TabMove(-1)<CR>
nnoremap <S-n> :call TabMove(1)<CR>

"Move vim split screen 
"\mw to mark and \pw to swap with the current window
nmap <silent> <leader>' :call MarkWindowSwap()<CR>
nmap <silent> <leader>] :call DoWindowSwap()<CR>
