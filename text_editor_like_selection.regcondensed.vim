" Vim replace commands to run:
" :%s/\v(.+)/vn <\1> <esc><\1>\rvn <s-\1> <\1>\rino <s-\1> <c-o>v<\1>\r/g
" 
" Then remove visual keybinds for C-Left & C-Right

home
end
up
down
left
right


c-left
c-right
