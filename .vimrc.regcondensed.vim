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
let g:netrw_list_hide='.*\.class$,^\./$'
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
nn <Tab> >>
vn <Tab> >gv
in <expr> <Tab> TabFn()
nn <S-Tab> <<
vn <S-Tab> <gv
in <S-Tab> <C-D>


" Misc
nn <LeftMouse> <LeftMouse>a
vn <MiddleMouse> "_dPi
n! <C-Bs> <C-W>

n! <C-H> <C-W>
in <C-D> X<Esc>ce
vn <silent> c y

vn <silent> v "_dP
vn <Bs> "_d
vn <Del> "_d


" NVI (Normal/Visual/Insert) Keybinds
#W :q!<CR>
#T :Tex<CR>
#G :Vex!<CR>

#Q :Rex<CR>
#K :!javac -Xlint:rawtypes %<CR>
#A ggVG

a#N <C-W>r
a#S :up!<CR>
a#Y <C-R>

i#Z u
