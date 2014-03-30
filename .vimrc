set nocompatible

set rtp+=/usr/local/go/misc/vim/
filetype plugin indent on
syntax on
" Pathogen
call pathogen#infect()
call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on

syntax on
set number
set mouse=a
set mousehide

" set spell
set hlsearch
set showmatch
set incsearch
set ignorecase
set autoindent
set history=100
set cursorline
" if has("unnamedplus")
"   set clipboard=unnamedplus
" elseif has("clipboard")
"   set clipboard=unnamed
" endif

" clipboard => system
set clipboard=unnamed


set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Nerdtree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0


" JPoz extras
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>
set colorcolumn=80
set dir=~/tmp
set backupdir=~/backups

let NERDTreeIgnore=['\.DS_Store','\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']

" if has('gui_running')
"     set background=light
"     colorscheme solarized
" else
"     set background=dark
"     colorscheme Tomorrow
" endifo
"
" Jellybean
" let g:jellybeans_use_lowcolor_black = 0
" colorscheme jellybeans

" base-16
" if has('gui_running')
"   set background=dark
"   colorscheme base16-solarized
" else
"   set background=light
"   colorscheme Tomorrow
" endif
set background=dark
colorscheme solarized

" Symbol plug-in settings
set wildmode=list:longest,full
set wildmenu
let g:symbol_patterns = { 'javascript': ['^\s\{0,3}\zs\w\+\ze:'], 'ruby': ['^\s\+def\s\%[self\.]\zs[A-z]\+\ze'] }

nnoremap <C-J> :call Complete('Symbol')<CR>

" Stop the damn beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Awesome tabs and good scrollbards
set guioptions-=lrb
set guioptions-=e
set guioptions-=L
set guioptions-=r
" SIMPLE
let g:fugitive_github_domains = ['https://github.banksimple.com']

" | vertial splits
hi VertSplit guibg=NONE

" GOVIM
function! s:GoLint()
  cexpr system("golint " . shellescape(expand('%')))
  copen
endfunction
command! GoLint :call s:GoLint()
" au FileType go au BufWritePre <buffer> Fmt
" let g:SuperTabDefaultCompletionType = "context"
let g:gocode_gofmt_tabwidth = ""
let g:gocode_gofmt_tabs     = ""

" DASH
:nmap <silent> <leader>d <Plug>DashSearch

" WHITESPACE
" autocmd BufWritePost * FixWhitespace
"
" YANKSTACK CONFIG
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
