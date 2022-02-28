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
inoremap <expr> <tab> Tabfn()
inoremap <s-tab> <c-d>


" Misc
nnoremap <leftmouse> <leftmouse>a
vnoremap <middlemouse> "_dPi

noremap! <c-h> <c-w>
vnoremap c y

vnoremap <bs> "_d


" NVI (Normal/Visual/Insert) Keybinds
nnoremap <c-w> :q!<cr>
vnoremap <c-w> <c-c>:q!<cr>
inoremap <c-w> <esc>:q!<cr>

nnoremap <c-t> :Te<cr>
vnoremap <c-t> <c-c>:Te<cr>
inoremap <c-t> <esc>:Te<cr>

nnoremap <c-g> :Ve!<cr>
vnoremap <c-g> <c-c>:Ve!<cr>
inoremap <c-g> <esc>:Ve!<cr>


nnoremap <c-q> :Re<cr>
vnoremap <c-q> <c-c>:Re<cr>
inoremap <c-q> <esc>:Re<cr>

nnoremap <c-k> :!javac -Xlint:all %<cr>
vnoremap <c-k> <c-c>:!javac -Xlint:all %<cr>
inoremap <c-k> <esc>:!javac -Xlint:all %<cr>


nnoremap <c-n> <c-w>r
vnoremap <c-n> <c-c><c-w>r
inoremap <c-n> <esc><c-w>ra

nnoremap <c-s> :up!<cr>
vnoremap <c-s> <c-c>:up!<cr>
inoremap <c-s> <esc>:up!<cr>a

nnoremap <c-y> <c-r>
vnoremap <c-y> <c-c><c-r>
inoremap <c-y> <esc><c-r>a


nnoremap <c-z> u
vnoremap <c-z> <c-c>u
inoremap <c-z> <esc>ui


source ~/nonessentials/autocomplete_pop.vim
