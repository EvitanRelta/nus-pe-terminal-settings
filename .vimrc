" Turn on syntax highlighting
syntax on
" Turn on smart auto-indentation
set autoindent
set smartindent
filetype plugin indent on
" Turn on auto-backup before editing
set backup
" Use ~/.backup as the backup directory
set backupdir=~/.backup
" Replace all tab with spaces
set expandtab
" Wrap long line at reasonable places (only affect 
" display, not content)
set wrap
set linebreak
" Make vim less like vi
set nocompatible
" Make default indent at 2 spaces
set shiftwidth=2
" Set tab stop to 2
set tabstop=2

" uncomment to turn on line number
" "set number

" vim is optimized for keyboard-only, but if you insist on using mouse,
" uncomment the following
set mouse=a

" uncomment the following to show ruler (line,colum position)
" set ruler 

" some advanced options requested by students.  Use them only if
" you know what you are doing (I don't know what they do!)
" set hidden 
set wildmenu 
set wildmode=longest:list,full
" set showcmd 
" set hlsearch 
" set confirm 
" set visualbell 
set ignorecase 
set smartcase

" The following should give 16 colors on old Windows machine
"set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"set t_Co=16

" The following change the backspace on old Windows machine
set t_kb=

" For students who are used to using the psvm/sout/sop abbreviation, you can
" uncomment the following.
"
" abbr psvm public static void main(String[] args){<CR>}<esc>O
" abbr sout System.out.println("");<esc>2hi
" abbr sop System.out.print("");<esc>2hi

"" PLUGINS
" vim-rainbow
" let g:rainbow_active = 1

" For lightline
" set laststatus=2
" let g:lightline = { 'colorscheme': 'wombat' }

function! InsertTabWrapper()
  let col = col('.') - 1
  if pumvisible()
    return "\<C-y>"
  elseif !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Hide compiled java files
let g:netrw_list_hide= '.*\.class$'

" [Ctrl + Backspace] deletes previous word
set backspace=indent,eol,start
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" [Ctrl + D] deletes next word
imap <C-D> X<Esc>lbce

" [Ctrl + S] save & quit
noremap <silent> <C-S> :w!<CR>:Rex<CR>
vnoremap <silent> <C-S> <C-C>:w!<CR>:Rex<CR>
inoremap <silent> <C-S> <Esc>:w!<CR>:Rex<CR>

" [Ctrl + Q] quit without saving
noremap <silent> <C-Q> :u0<CR>:Rex<CR>
vnoremap <silent> <C-Q> <C-C>:u0<CR>:Rex<CR>
inoremap <silent> <C-Q> <Esc>:u0<CR>:Rex<CR>

" [Ctrl + Z] undo
noremap <silent> <C-Z> u
inoremap <silent> <C-Z> <Esc>ui

" [Ctrl + Y] redo
noremap <silent> <C-Y> <C-R>
inoremap <silent> <C-Y> <Esc><C-R>i

" [Ctrl + K] (normal mode) compile all .java file in current dir
noremap <silent> <C-K> :!javac *.java<CR>

" LMB goes into insert mode
nnoremap <LeftMouse> <LeftMouse>a

" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Start in insert mode
" au BufRead,BufNewFile * startinsert
