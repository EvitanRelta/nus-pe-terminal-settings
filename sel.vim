" Vim replace commands to run:
" :%s/\v(.+)/vn <\1> <esc><\1>\rvn <s-\1> <\1>\rino <s-\1> <c-o>v<\1>\r/g
" 
" Then remove visual keybinds for C-Left & C-Right

vn <home> <esc><home>
vn <s-home> <home>
ino <s-home> <c-o>v<home>

vn <end> <esc><end>
vn <s-end> <end>
ino <s-end> <c-o>v<end>

vn <up> <esc><up>
vn <s-up> <up>
ino <s-up> <c-o>v<up>

vn <down> <esc><down>
vn <s-down> <down>
ino <s-down> <c-o>v<down>

vn <left> <esc><left>
vn <s-left> <left>
ino <s-left> <c-o>v<left>

vn <right> <esc><right>
vn <s-right> <right>
ino <s-right> <c-o>v<right>



ino <s-c-left> <c-o>v<c-left>

ino <s-c-right> <c-o>v<c-right>


