vn <expr> <c-r> line('v') != line('.') ? ':s/<c-r>"/<c-r>"/g<left><left>' : 'y/<c-r>"<cr>:%s/<c-r>"/<c-r>"/g<left><left>'

" Run vim replace command:
" :%s/\v3([a-z-]+)/<\1>/g
"
" vn 3expr 3c-r line('v') != line('.') ? ':s/3c-r"/3c-r"/g3left3left' : 'y/3c-r"3cr:%s/3c-r"/3c-r"/g3left3left'
