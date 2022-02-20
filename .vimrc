source ./nonessentials/visual_replace.vim
source ./nonessentials/find.vim
source ./nonessentials/text_editor_like_selection.vim

syn on
filetype plugin indent on
se ai si bk et ic vb tf lbr hls
se scs cul wrap nocp wmnu noeb

se sw=2
se ts=2
se ls=2
se bdir=~/.backup
se cc=80
se t_vb=
se t_kb=
se bs=indent,eol,start
se mouse=a
se ttym=sgr
se ve=onemore
se wim=longest:list,full
se sel=exclusive

let g:lightline={ 'colorscheme': 'deus' }
let g:netrw_list_hide='.*\.class$,^\./$'
let g:netrw_altv=1
let g:delimitMate_expand_cr = 1

au BufLeave * call feedkeys("\<Esc>", 't')
colorscheme codedark
argadd ./*.java

" Indentation
function! TabFn()
  if pumvisible()
    return "\<C-Y>"
  elseif getline('.')[col('.') - 2] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-P>"
  endif
endfunction
nnoremap <Tab> >>
vnoremap <Tab> >gv
inoremap <expr> <Tab> TabFn()
nnoremap <S-Tab> <<
vnoremap <S-Tab> <gv
inoremap <S-Tab> <C-D>

" LMB goes into insert mode
nnoremap <LeftMouse> <LeftMouse>a

" Fix MMB copy-then-paste, instead of just pasting
vnoremap <MiddleMouse> "_dPi

noremap! <C-Bs> <C-W>
noremap! <C-H> <C-W>

" [Ctrl + D] deletes next word
inoremap <C-D> X<Esc>ce

" [C] (visual) yank
vnoremap <silent> c y

" [V] (visual) paste
vnoremap <silent> v "_dP

" [Ctrl + S] save
nnoremap <silent> <C-S> :up!<CR>
vnoremap <silent> <C-S> <C-C>:up!<CR>
inoremap <silent> <C-S> <Esc>:up!<CR>a

" [Ctrl + W] quit without saving
nnoremap <silent> <C-W> :q!<CR>
vnoremap <silent> <C-W> <C-C>:q!<CR>
inoremap <silent> <C-W> <Esc>:q!<CR>

" [Ctrl + T] new explorer tab
nnoremap <silent> <C-T> :Tex<CR>
vnoremap <silent> <C-T> <C-C>:Tex<CR>
inoremap <silent> <C-T> <Esc>:Tex<CR>

" [Ctrl + G] new explorer split
nnoremap <silent> <C-G> :Vex!<CR>
vnoremap <silent> <C-G> <C-C>:Vex!<CR>
inoremap <silent> <C-G> <Esc>:Vex!<CR>

" [Ctrl + Q] return to explorer
nnoremap <silent> <C-Q> :Rex<CR>
vnoremap <silent> <C-Q> <C-C>:Rex<CR>
inoremap <silent> <C-Q> <Esc>:Rex<CR>

" [Ctrl + N] swap split windows
nnoremap <silent> <C-N> <C-W>r
vnoremap <silent> <C-N> <C-C><C-W>r
inoremap <silent> <C-N> <Esc><C-W>ra

" [Ctrl + Z] undo
nnoremap <silent> <C-Z> u
vnoremap <silent> <C-Z> <C-C>u
inoremap <silent> <C-Z> <Esc>ui

" [Ctrl + Y] redo
nnoremap <silent> <C-Y> <C-R>
vnoremap <silent> <C-Y> <C-C><C-R>
inoremap <silent> <C-Y> <Esc><C-R>a

" [Ctrl + A] visually select all
nnoremap <silent> <C-A> ggVG
vnoremap <silent> <C-A> <C-C>ggVG
inoremap <silent> <C-A> <Esc>ggVG

" [Ctrl + K] compile current file
nnoremap <silent> <C-K> :!javac -Xlint:rawtypes %<CR>
vnoremap <silent> <C-K> <C-C>:!javac -Xlint:rawtypes %<CR>
inoremap <silent> <C-K> <Esc>:!javac -Xlint:rawtypes %<CR>

" Delete selection
vnoremap <Bs> "_d
vnoremap <Del> "_d
