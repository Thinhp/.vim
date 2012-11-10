"Filename : Vimrc
"Version: 1
"Author: TanThinh

"======================== USING PATHOGEN ===================
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


"=============== END KEY SETTINGS ==================================

set lines=50 columns=130 "Default size
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
set number		"Set line numbers
set shiftwidth=4	"Indent by 4 spaces when pressing >>, <<, ==
set shiftround		"Use multiple of shiftwidth when indenting < or >
set softtabstop=4	" indent by 4 spaces when pressing TAB
set history=1000	"remember more commands and search history
set undolevels=1000	"Use many muchos levels of undo
set wildignore =*.swp,*.bak,*.pyc,*.class
set title		"Change terminal title
set colorcolumn=80	"80-character indicator line
set clipboard=unnamedplus "copy-paste in a same way ( same clipboard as system)
colorscheme default

"Always enable Powerline
set laststatus=2    "Always show status line
set encoding=utf-8  "	show Unicode glyphs

"Do not keep backup files
set nobackup
set nowritebackup
set noswapfile

"Easier block indenting (does not exit visual mode after once)
vnoremap < <gv
vnoremap > >gv

filetype plugin indent on	"Turn on indentation for recognized file types

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

"Auto call NerdTree when start-up
autocmd VimEnter * NERDTree

"Auto quit NerdTree if it stands alone
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Auto reload .vimrc
" The call Pl#Load() at the end is to reload Powerine
""augroup myvimrc
""    au!
""    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | 
""    if has('gui_running') | so $MYGVIMRC | endif | call Pl#Load()
""augroup END

"================== CHANGES PRESSING KEYS ===============================

" ';' can be used as ':'
nnoremap ; :

"Change search and replace settins
nnoremap <Leader>sr :%s/

"Write force files with sudo permission
command WriteForce w<Space>!sudo<Space>tee<Space>%
nnoremap <Leader>wf :WriteForce<CR>

