" Vim replace commands to run (in order):
" 1. :%s/\v3([^" ]+)/<\1>/g
" 2. :%s/\v^(.?)#(.) (.+)/nn <c-\2> \3\rvn <c-\2> <c-c>\3\rin <c-\2> <esc>\3\1\r/g
" 3. :%s/\v^([nvi]+)/\1oremap/g

syn on
filetype plugin indent on
se ai si nobk et ic vb tf lbr hls spr
se scs cul wrap nocp wmnu noeb

se sw=2 ts=2 ls=2 cc=80 t_vb=
se bs=indent,eol,start mouse=a
se ttym=sgr ve=onemore
se wim=longest:list,full sel=exclusive

let g:netrw_list_hide='.*\.class$'
let g:delimitMate_expand_cr=1

au BufLeave * call feedkeys("\3esc", 't')
colo codedark
argadd ./*.java

" Indentation
fu Tabfn()
  if pumvisible()
    return "\3c-y"
  elseif getline('.')[col('.') - 2] !~ '\k'
    return "\3tab"
  else
    return "\3c-p"
  endif
endfunction
in 3expr 3tab Tabfn()
in 3s-tab 3c-d


" Misc
nn 3leftmouse <leftmouse>a
vn 3middlemouse "_dPi

n! 3c-h 3c-w
vn c y

vn 3bs "_d


" NVI (Normal/Visual/Insert) Keybinds
#w :q!3cr
#t :Tex3cr
#g :Vex!3cr

#q :Rex3cr
#k :!javac -Xlint:all %3cr

a#n <c-w>r
a#s :up!3cr
a#y 3c-r

i#z u
