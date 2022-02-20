" Vim replace commands to run:
" 1. :%s/\v^#([A-Za-z-]+)/vnoremap <\1> <Esc><\1>\rvnoremap <S-\1> <\1>\rinoremap <S-\1> <C-O>v<\1>\r/g

" Then remove visual keybinds for C-Left & C-Right

#Home
#End
#Up
#Down
#Left
#Right


#C-Left
#C-Right
