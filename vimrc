call plug#begin('~/.vim/plugged')

Plug 'skanehira/preview-markdown.vim'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'

" If you don't have nodejs and yarn
" use pre build
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'

Plug 'w0rp/ale'

" Distraction free writing by removing UI elements and centering everything.
Plug 'junegunn/goyo.vim'

call plug#end()

"set background=dark
"colorscheme solarized
"let g:solarized_termtrans=1

set nocompatible
set clipboard=unnamed
set wildmenu
set esckeys
set backspace=indent,eol,start
set ttyfast
set gdefault
set encoding=utf-8 nobomb
let mapleader=","
set binary
set noeol
set modeline
set modelines=4
set exrc
set secure
"set number
set cursorline
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set ignorecase
set incsearch
set laststatus=2
"set mouse=a
set noerrorbells
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set showcmd
set noundofile


" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file (restore to previous version)
"  if has('persistent_undo')
"    set undofile	" keep an undo file (undo changes after closing)
"  endif
"endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set paste
set expandtab
set tabstop=2
set shiftwidth=2
set t_Co=256
set backupdir=~/.tmp
set mouse=r
set hlsearch
syntax on

set smartcase
map <Leader>h :set invhls <CR>

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
"hi Search guibg=peru guifg=wheat
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" Plugin settings
"let g:mkdp_auto_close=0
"let g:mkdp_refresh_slow=1

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
