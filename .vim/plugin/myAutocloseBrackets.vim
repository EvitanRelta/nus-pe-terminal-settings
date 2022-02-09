" Auto close brackets for .java files
function! AutoCloseBracket(openingChar, closingChar)
  let col = col('.') - 1
  let isAfterALetter = !col || getline('.')[col - 1] !~ '\k'
  if isAfterALetter
    return a:openingChar . a:closingChar . "\<LEFT>"
  endif
  return a:openingChar
endfunction
au FileType java inoremap <expr> " AutoCloseBracket('"', '"')
au FileType java inoremap "" ""
au FileType java inoremap "<BS> <NOP>
au FileType java inoremap <expr> ' AutoCloseBracket("'", "'")
au FileType java inoremap '' ''
au FileType java inoremap '<BS> <NOP>
au FileType java inoremap ( ()<LEFT>
au FileType java inoremap () ()
au FileType java inoremap (<BS> <NOP>
au FileType java inoremap [ []<LEFT>
au FileType java inoremap [] []
au FileType java inoremap [<BS> <NOP>
au FileType java inoremap { {}<LEFT>
au FileType java inoremap {} {}
au FileType java inoremap {<BS> <NOP>
au FileType java inoremap {<CR> {<CR>}<ESC>O
au FileType java inoremap {;<CR> {<CR>};<ESC>O
