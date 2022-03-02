" Vim replace commands to run (in order):
" :%s/\vs$/3cr/g
" :%s/\v3([^" ]+)/<\1>/g
" :%s/\v^(.?)a(.) (.+)/nn <c-\2> \3\rvn <c-\2> <c-c>\3\rino <c-\2> <esc>\3\1\r/g

syn on
filetype plugin indent on
se ai si nobk et ic vb tf lbr hls spr
se scs cul wrap nocp wmnu noeb

se sw=2 ts=2 ls=2 cc=80 t_vb=
se mouse=a ttym=sgr ve=onemore
se wim=longest:list,full sel=exclusive

let g:netrw_list_hide='.*\.class$'
let g:delimitMate_expand_cr=1

aut bufleave * call feedkeys("\3esc", 't')
colo codedark
arga ./*.java

" Indentation
fu Tabfn()
  if pumvisible()
    retu "\3c-y"
  elsei getline('.')[col('.') - 2] !~ '\k'
    retu "\3tab"
  else
    retu "\3c-p"
  en
endf
ino 3expr 3tab Tabfn()
ino 3s-tab 3c-d


" Misc
nn 3leftmouse <leftmouse>a
vn 3middlemouse "_dPi

no! 3c-h 3c-w
vn c y

vn 3bs "_d


" NVI (Normal/Visual/Insert) Keybinds
aw :q!s
at :Tes
ag :Ve!s

aq :Res
ak :!javac -Xlint:all %s

aan <c-w>r
aas :up!s
aay 3c-r

iaz u
