" Vim replace commands to run (in order):
" 1. :%s/\v^(.?)#(.) (.+)/nn <c-\2> \3\rvn <c-\2> <c-c>\3\rin <c-\2> <esc>\3\1\r/g
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
in <expr> <tab> Tabfn()
in <s-tab> <c-d>


" Misc
nn <leftmouse> <leftmouse>a
vn <middlemouse> "_dPi

n! <c-h> <c-w>
vn c y

vn <bs> "_d


" NVI (Normal/Visual/Insert) Keybinds
#w :q!<cr>
#t :Tex<cr>
#g :Vex!<cr>

#q :Rex<cr>
#k :!javac -Xlint:all %<cr>

a#n <c-w>r
a#s :up!<cr>
a#y <c-r>

i#z u
