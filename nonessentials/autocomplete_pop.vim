set completeopt=menu,menuone,noinsert
au InsertCharPre * call AutoCompletePop()
fu AutoCompletePop()
  if v:char =~ '\K' && !pumvisible()
    call feedkeys("\<C-P>", 'n')
  end
endfun
