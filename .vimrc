source ./nonessentials/visual_replace.vim
source ./nonessentials/find.vim

syntax on
filetype plugin indent on
se ai si bk et wrap lbr nocp
se wmnu hls ic scs cul tf noeb vb

se t_kb=
se bdir=~/.backup
se sw=2
se ts=2
se mouse=a
se ttym=sgr
se wim=longest:list,full
se ls=2
se bs=indent,eol,start
se ve=onemore
se cc=80
se sel=exclusive
se t_vb=

" LMB goes into insert mode
nnoremap <LeftMouse> <LeftMouse>a

" Fix MMB copy-then-paste, instead of just pasting
vnoremap <MiddleMouse> "_dPi

" Ensures normal mode when changing tabs/windows/buffers
au BufLeave * call feedkeys("\<ESC>", 't')

let g:lightline = { 'colorscheme': 'deus' }

" Indentation
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
nnoremap <Tab> >>
inoremap <expr> <tab> InsertTabWrapper()
vnoremap <Tab> >gv

" Decrease indentation
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv
inoremap <S-Tab> <C-d>

" Hide compiled java files
let g:netrw_list_hide= '.*\.class$'

" Open new split view ([V] in Netrw) on right instead of left
let g:netrw_altv=1

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Shift selection
inoremap <S-HOME> <C-O>v<HOME>
inoremap <S-END> <C-O>v<END>
inoremap <C-S-LEFT> <C-O>v<C-LEFT>
inoremap <C-S-RIGHT> <C-O>v<C-RIGHT>
inoremap <S-LEFT> <C-O>v<LEFT>
inoremap <S-RIGHT> <C-O>v<RIGHT>
inoremap <S-UP> <C-O>v<UP>
inoremap <S-DOWN> <C-O>v<DOWN>

" Make visual insert mode more like normal text editor
vnoremap <HOME> <ESC><HOME>
vnoremap <END> <ESC><END>
vnoremap <S-HOME> <HOME>
vnoremap <S-END> <END>

vnoremap <LEFT> <ESC><LEFT>
vnoremap <RIGHT> <ESC><RIGHT>
vnoremap <S-LEFT> <LEFT>
vnoremap <S-RIGHT> <RIGHT>

vnoremap <UP> <ESC><UP>
vnoremap <DOWN> <ESC><DOWN>
vnoremap <S-UP> <UP>
vnoremap <S-DOWN> <DOWN>

" [Ctrl + D] deletes next word
inoremap <C-D> X<Esc>ce

" [C] (visual) yank
vnoremap <silent> c y

" [V] (visual) paste
vnoremap <silent> v "_dP

" [Ctrl + S] save
nnoremap <silent> <C-S> :w!<CR>
vnoremap <silent> <C-S> <C-C>:w!<CR>
inoremap <silent> <C-S> <Esc>:w!<CR>a


function! QuitWOSaving()
  if &ft ==# "netrw"
    :q!
  else
    let numOfWindows = len(range(1, winnr('$')))
    let numOfTabs = len(range(1, tabpagenr('$')))
    if numOfWindows != 1 || numOfTabs != 1
      :q!
      return
    endif
    try
      :Rex
    catch
      :q!
    endtry
  endif
endfunction
" [Ctrl + W] quit without saving
nnoremap <silent> <C-W> :call QuitWOSaving()<CR>
vnoremap <silent> <C-W> <C-C>:call QuitWOSaving()<CR>
inoremap <silent> <C-W> <Esc>:call QuitWOSaving()<CR>

" [Ctrl + T] new explorer tab
noremap <silent> <C-T> :Tex<CR>
vnoremap <silent> <C-T> <C-C>:Tex<CR>
inoremap <silent> <C-T> <Esc>:Tex<CR>

" [Ctrl + G] new explorer split
noremap <silent> <C-G> :Vex!<CR>
vnoremap <silent> <C-G> <C-C>:Vex!<CR>
inoremap <silent> <C-G> <Esc>:Vex!<CR>

" [Ctrl + Q] return to explorer
noremap <silent> <C-Q> :Rex<CR>
vnoremap <silent> <C-Q> <C-C>:Rex<CR>
inoremap <silent> <C-Q> <Esc>:Rex<CR>

" [Ctrl + N] swap split windows
noremap <silent> <C-N> <C-W>r
vnoremap <silent> <C-N> <C-W>r
inoremap <silent> <C-N> <C-W>r

" [Ctrl + Z] undo
nnoremap <silent> <C-Z> u
vnoremap <silent> <C-Z> <C-C>u
inoremap <silent> <C-Z> <Esc>ui

" [Ctrl + Y] redo
nnoremap <silent> <C-Y> <C-R>
vnoremap <silent> <C-Y> <C-C><C-R>
inoremap <silent> <C-Y> <Esc><C-R>i

" [Ctrl + A] visually select all
nnoremap <silent> <C-A> ggVG
vnoremap <silent> <C-A> <C-C>ggVG
inoremap <silent> <C-A> <Esc>ggVG

" [Ctrl + K] compile current file
nnoremap <silent> <C-K> :!javac -Xlint:rawtypes %<CR>
vnoremap <silent> <C-K> <C-C>:!javac -Xlint:rawtypes %<CR>
inoremap <silent> <C-K> <Esc>:!javac -Xlint:rawtypes %<CR>

" [Ctrl + B] (normal mode) vertical split diff with current file
nnoremap <silent> <C-B> :vert diffsplit 

" VSCode-like colorscheme
colorscheme codedark

" Delete selection
vnoremap <BS> "_d
vnoremap <Del> "_d

" Auto-complete keywords from every .java file in current dir
" You'll have start vim in working directory first.
argadd ./*.java

" Start in insert mode
" au BufRead,BufNewFile * startinsert

" DelimitMate expand: function fn() {<CR>} gives
" function fn() {
"   //cursor here
" }
let g:delimitMate_expand_cr = 1
