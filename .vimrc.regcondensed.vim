" Vim replace commands to run (in order):
" 1. :%s/\v^(.?)#([a-z]) (.+)/nn <c-\2> \3\rvn <c-\2> <c-c>\3\rin <c-\2> <esc>\3\1\r/g
" 2. :%s/\v^([nvi]+)/\1oremap/g

syn on
filetype plugin indent on
se ai si nobk et ic vb tf lbr hls spr
se scs cul wrap nocp wmnu noeb

se sw=2 ts=2 ls=2 cc=80 t_vb=
se bs=indent,eol,start mouse=a
se ttym=sgr ve=onemore
se wim=longest:list,full sel=exclusive

let g:netrw_list_hide='.*\.class$'
let g:netrw_altv=1
let g:delimitMate_expand_cr = 1

au BufLeave * call feedkeys("\<esc>", 't')
colo codedark
argadd ./*.java

" Indentation
fu Tabfn()
  if pumvisible()
    return "\<c-y>"
  elseif getline('.')[col('.') - 2] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
nn <tab> >>
vn <tab> >gv
in <expr> <tab> Tabfn()
nn <s-tab> <<
vn <s-tab> <gv
in <s-tab> <c-d>


" Misc
nn <leftmouse> <leftmouse>a
vn <middlemouse> "_dPi
n! <c-bs> <c-w>

n! <c-h> <c-w>
in <c-d> X<esc>ce
vn c y

vn v "_dP
vn <bs> "_d
vn <del> "_d


" NVI (Normal/Visual/Insert) Keybinds
#w :q!<cr>
#t :Tex<cr>
#g :Vex!<cr>

#q :Rex<cr>
#k :!javac -Xlint:rawtypes %<cr>
#a ggVG

a#n <c-w>r
a#s :up!<cr>
a#y <c-r>

i#z u
