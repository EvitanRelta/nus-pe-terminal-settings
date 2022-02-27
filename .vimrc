" Vim replace commands to run (in order):
" 1. :%s/\v^(.?)#([A-Z]) (.+)/nn <silent> <C-\2> \3\rvn <silent> <C-\2> <C-C>\3\rin <silent> <C-\2> <Esc>\3\1\r/g
" 2. :%s/\v^([nvi]+)/\1oremap/g

syn on
filetype plugin indent on
se ai si bk et ic vb tf lbr hls spr
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
let g:netrw_list_hide='.*\.class$,^\./$,^\.nfs[^\.]*'
let g:netrw_altv=1
let g:delimitMate_expand_cr = 1

au BufLeave * call feedkeys("\<Esc>", 't')
colo codedark
argadd ./*.java

" Indentation
fu TabFn()
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


" Misc
nnoremap <LeftMouse> <LeftMouse>a
vnoremap <MiddleMouse> "_dPi
noremap! <C-Bs> <C-W>

noremap! <C-H> <C-W>
inoremap <C-D> X<Esc>ce
vnoremap <silent> c y

vnoremap <silent> v "_dP
vnoremap <Bs> "_d
vnoremap <Del> "_d


" NVI (Normal/Visual/Insert) Keybinds
nnoremap <silent> <C-W> :q!<CR>
vnoremap <silent> <C-W> <C-C>:q!<CR>
inoremap <silent> <C-W> <Esc>:q!<CR>

nnoremap <silent> <C-T> :Tex<CR>
vnoremap <silent> <C-T> <C-C>:Tex<CR>
inoremap <silent> <C-T> <Esc>:Tex<CR>

nnoremap <silent> <C-G> :Vex!<CR>
vnoremap <silent> <C-G> <C-C>:Vex!<CR>
inoremap <silent> <C-G> <Esc>:Vex!<CR>


nnoremap <silent> <C-Q> :Rex<CR>
vnoremap <silent> <C-Q> <C-C>:Rex<CR>
inoremap <silent> <C-Q> <Esc>:Rex<CR>

nnoremap <silent> <C-K> :!javac -Xlint:rawtypes %<CR>
vnoremap <silent> <C-K> <C-C>:!javac -Xlint:rawtypes %<CR>
inoremap <silent> <C-K> <Esc>:!javac -Xlint:rawtypes %<CR>

nnoremap <silent> <C-A> ggVG
vnoremap <silent> <C-A> <C-C>ggVG
inoremap <silent> <C-A> <Esc>ggVG


nnoremap <silent> <C-N> <C-W>r
vnoremap <silent> <C-N> <C-C><C-W>r
inoremap <silent> <C-N> <Esc><C-W>ra

nnoremap <silent> <C-S> :up!<CR>
vnoremap <silent> <C-S> <C-C>:up!<CR>
inoremap <silent> <C-S> <Esc>:up!<CR>a

nnoremap <silent> <C-Y> <C-R>
vnoremap <silent> <C-Y> <C-C><C-R>
inoremap <silent> <C-Y> <Esc><C-R>a


nnoremap <silent> <C-Z> u
vnoremap <silent> <C-Z> <C-C>u
inoremap <silent> <C-Z> <Esc>ui


vnoremap <Home> <Esc><Home>
vnoremap <S-Home> <Home>
inoremap <S-Home> <C-O>v<Home>

vnoremap <End> <Esc><End>
vnoremap <S-End> <End>
inoremap <S-End> <C-O>v<End>

vnoremap <Up> <Esc><Up>
vnoremap <S-Up> <Up>
inoremap <S-Up> <C-O>v<Up>

vnoremap <Down> <Esc><Down>
vnoremap <S-Down> <Down>
inoremap <S-Down> <C-O>v<Down>

vnoremap <Left> <Esc><Left>
vnoremap <S-Left> <Left>
inoremap <S-Left> <C-O>v<Left>

vnoremap <Right> <Esc><Right>
vnoremap <S-Right> <Right>
inoremap <S-Right> <C-O>v<Right>

inoremap <S-C-Left> <C-O>v<C-Left>
inoremap <S-C-Right> <C-O>v<C-Right>

