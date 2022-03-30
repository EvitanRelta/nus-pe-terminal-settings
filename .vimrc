" Vim replace commands to run (in order):
" :%s/\vs$/3cr/g
" :%s/\v3([^" ']+)/<\1>/g
" :%s/\v^(.?)a(.) (.+)/nn <c-\2> \3\rvn <c-\2> <c-c>\3\rino <c-\2> <esc>\3\1\r/g

syn on
filetype plugin indent on
se ai si nobk et vb tf lbr hls spr
se cul wrap nocp wmnu noeb

se sw=2 ts=2 ls=2 cc=80 t_vb=
se mouse=a ttym=sgr ve=onemore cpt=.,u
se wim=longest:list,full sel=exclusive

let g:netrw_list_hide='.*\.class$'
let g:delimitMate_expand_cr=1

aut bufleave * call feedkeys("\<esc>", 't')
colo codedark
arga *.java

" Indentation
ino <expr> <tab> pumvisible() ? '<c-y>' : getline('.')[col('.')-2] !~ '\k' ? '<tab>' : '<c-p>'
ino <s-tab> <c-d>


" Misc
nn <leftmouse> <leftmouse>a
vn <middlemouse> "_dPi

no! <c-h> <c-w>
vn c y

vn <bs> "_d
vn <c-f> y/<c-r>"<cr>

ino <home> <c-o>^


" NVI (Normal/Visual/Insert) Keybinds
nn <c-w> :q!<cr>
vn <c-w> <c-c>:q!<cr>
ino <c-w> <esc>:q!<cr>

nn <c-t> :Te<cr>
vn <c-t> <c-c>:Te<cr>
ino <c-t> <esc>:Te<cr>

nn <c-g> :Ve!<cr><c-w>=
vn <c-g> <c-c>:Ve!<cr><c-w>=
ino <c-g> <esc>:Ve!<cr><c-w>=


nn <c-q> :Re<cr>
vn <c-q> <c-c>:Re<cr>
ino <c-q> <esc>:Re<cr>

nn <c-k> :!clear; javac -Xlint:unchecked,rawtypes %<cr>
vn <c-k> <c-c>:!clear; javac -Xlint:unchecked,rawtypes %<cr>
ino <c-k> <esc>:!clear; javac -Xlint:unchecked,rawtypes %<cr>


nn <c-n> <c-w>r
vn <c-n> <c-c><c-w>r
ino <c-n> <esc><c-w>ra

nn <c-s> :up!<cr>
vn <c-s> <c-c>:up!<cr>
ino <c-s> <esc>:up!<cr>a

nn <c-y> <c-r>
vn <c-y> <c-c><c-r>
ino <c-y> <esc><c-r>a


nn <c-z> u
vn <c-z> <c-c>u
ino <c-z> <esc>ui

so ~/sel.vim
