" Turn on syntax highlighting
syntax on
" Turn on smart auto-indentation
set autoindent
set smartindent
filetype plugin indent on
" Turn on auto-backup before editing
set backup
" Use ~/.backup as the backup directory
set backupdir=~/.backup
" Replace all tab with spaces
set expandtab
" Wrap long line at reasonable places (only affect 
" display, not content)
set wrap
set linebreak
" Make vim less like vi
set nocompatible
" Make default indent at 2 spaces
set shiftwidth=2
" Set tab stop to 2
set tabstop=2

" uncomment to turn on line number
" "set number

" vim is optimized for keyboard-only, but if you insist on using mouse,
" uncomment the following
set mouse=a

" Fix mouse not working on split screens
set ttymouse=sgr

" LMB goes into insert mode
nnoremap <LeftMouse> <LeftMouse>a

" uncomment the following to show ruler (line,colum position)
" set ruler 

" some advanced options requested by students.  Use them only if
" you know what you are doing (I don't know what they do!)
" set hidden 
set wildmenu 
set wildmode=longest:list,full
" set showcmd 
set hlsearch 
" set confirm 
" set visualbell 
set ignorecase 
set smartcase

" The following should give 16 colors on old Windows machine
"set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
"set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"set t_Co=16

" The following change the backspace on old Windows machine
set t_kb=

" For students who are used to using the psvm/sout/sop abbreviation, you can
" uncomment the following.
"
" abbr psvm public static void main(String[] args){<CR>}<esc>O
" abbr sout System.out.println("");<esc>2hi
" abbr sop System.out.print("");<esc>2hi

"" PLUGINS
" vim-rainbow
" let g:rainbow_active = 1

" For lightline
" set laststatus=2
" let g:lightline = { 'colorscheme': 'wombat' }

" Indentation
function! InsertTabWrapper()
  let col = col('.') - 1
  if pumvisible()
    return "\<C-y>"
  elseif !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()

" Decrease indentation
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" Hide compiled java files
let g:netrw_list_hide= '.*\.class$'

" [Ctrl + Backspace] deletes previous word
" Requires 'stty -ixon' in ./bash_profile 
set backspace=indent,eol,start
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" [Ctrl + D] deletes next word
inoremap <C-D> X<Esc>ce

function! SaveAndQuit()
  if &ft ==# "netrw"
    :q!
  else
    let numOfWindows = len(range(1, winnr('$')))
    let numOfTabs = len(range(1, tabpagenr('$')))
    if numOfWindows != 1 || numOfTabs != 1
      :wq!
      return
    endif
    try
      :w!
      :Rex
    catch
      :wq!
    endtry
  endif
endfunction
" [Ctrl + S] save & quit
nnoremap <silent> <C-S> :call SaveAndQuit()<CR>
vnoremap <silent> <C-S> <C-C>:call SaveAndQuit()<CR>
inoremap <silent> <C-S> <Esc>:call SaveAndQuit()<CR>


function! QuitWOSaving()
  if &ft ==# "netrw"
    :q!
  else
    let numOfWindows = len(range(1, winnr('$')))
    let numOfTabs = len(range(1, tabpagenr('$')))
    if numOfWindows != 1 || numOfTabs != 1
      :q!
      return
    endif
    try
      :Rex
    catch
      :q!
    endtry
  endif
endfunction
" [Ctrl + Q] quit without saving
nnoremap <silent> <C-Q> :call QuitWOSaving()<CR>
vnoremap <silent> <C-Q> <C-C>:call QuitWOSaving()<CR>
inoremap <silent> <C-Q> <Esc>:call QuitWOSaving()<CR>

" [Ctrl + T] new explorer tab
noremap <silent> <C-T> :Tex<CR>
inoremap <silent> <C-T> <Esc>:Tex<CR>

" [Ctrl + Z] undo
nnoremap <silent> <C-Z> u
inoremap <silent> <C-Z> <Esc>ui

" [Ctrl + Y] redo
nnoremap <silent> <C-Y> <C-R>
inoremap <silent> <C-Y> <Esc><C-R>i

" [Ctrl + K] (normal mode) compile all .java file in current dir
nnoremap <silent> <C-K> :!javac *.java<CR>

" [Ctrl + F]
" (normal/insert mode) clear highlights
nnoremap <C-F> :noh<CR>
inoremap <C-F> <ESC>:noh<CR>a
" (visual mode) find selected text
vnoremap <C-F> y/<C-R>"<CR>


function! Replace()
  let isMultiLineSelection = line('v') != line('.')
  if isMultiLineSelection
    " Replace previously yanked text in selection
    return ":s/\<C-R>\"//g\<LEFT>\<LEFT>"
  endif
    " Highlight selected text, and replace all selected text
    return "y/\<C-R>\"\<CR>:%s/\<C-R>\"//g\<LEFT>\<LEFT>"
endfunction
" [CTRL + R] (visual)
vnoremap <expr> <C-R> Replace()

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
au FileType java inoremap <expr> ' AutoCloseBracket("'", "'")
au FileType java inoremap '' ''
au FileType java inoremap <expr> ( AutoCloseBracket('(', ')')
au FileType java inoremap () ()
au FileType java inoremap <expr> [ AutoCloseBracket('[', ']')
au FileType java inoremap [] []
au FileType java inoremap <expr> { AutoCloseBracket('{', '}')
au FileType java inoremap {} {}
au FileType java inoremap {<CR> {<CR>}<ESC>O
au FileType java inoremap {;<CR> {<CR>};<ESC>O

" [Ctrl + /] (visual) comment / uncomment selection
function! JavaVisualCommentAndUncomment()
  let isAllCommented = 1
  let [startLine, endLine] = sort([line('v'), line('.')])

  " Check if every line is commented
  while startLine <= endLine
    if getline(startLine) !~ "^\\s*//"
      let isAllCommented = 0
    endif
    let startLine += 1
  endwhile

  if isAllCommented
    return ":norm ^xx\<CR>"
  else
    return ":norm i//\<CR>"
  endif
endfunction
au FileType java vnoremap <expr> <C-_> JavaVisualCommentAndUncomment()


" [Ctrl + /] (insert) comment / uncomment line
function! JavaInsertCommentAndUncomment()
  let startingCol = col('.') - 1
  let isCommented = getline('.') =~ "^\\s*//"
  if isCommented
    return "\<ESC>I\<DEL>\<DEL>\<ESC>" . (startingCol - 1) . "|i"
  else
    return "\<ESC>I//\<ESC>" . (startingCol + 3) . "|i"
  endif
endfunction
au FileType java inoremap <expr> <C-_> JavaInsertCommentAndUncomment()

" VSCode-like colorscheme
colorscheme codedark

" Highlight 80 char boundary
set colorcolumn=80

" Selection indent
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Delete selection
vnoremap <BS> d
vnoremap <Del> d

" Disable error bell sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Prevent selecting newline in visual mode
set selection=exclusive

" Auto-complete keywords from every .java file in current dir
" You'll have start vim in working directory first.
argadd ./*.java


function! LoadTemplate()
  " Use .vim/templates/template.ext file, whr .ext is the new-file extension
  silent! 0r ~/.vim/templates/template.%:e

  " Replace all [FILE_NAME] with the new-file filename
  %s/\[FILE_NAME\]/\=expand("%:t:r")/g
  call cursor(3,5)
  call feedkeys('a')
endfunction

" Use template when creating new .java files
au BufNewFile *.java call LoadTemplate()

" Start in insert mode
" au BufRead,BufNewFile * startinsert
