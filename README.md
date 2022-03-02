# Simplified Vim settings

Settings simplified for PE by:

- replacing commands with their short-forms (eg. `colorscheme` -> `colo`)
- removing lesser-used feats. _(removed list found below)_
- using Regex to reduce the text needed to be typed

<br>

## Installation

Given a fresh PE, run the following commands:

```bash
cp ~cs2030s/.vimrc .
echo set mouse=a >> .vimrc
vim .bashrc
```

<br>

Add to `.bashrc`

```bash
stty -ixon
bind tab:menu-complete
bind c-h:backward-kill-word
bind -x '"\C-t":vim .'
```

<br>

Then run the bash commands:

```bash
source .bashrc
mkdir -p .vim/pack/plugins/start
ln -s ~cs2030s/.vim/vim-colorschemes/colors/ .vim
ln -s ~cs2030s/.vim/vim-plugins/delimitMate/ .vim/pack/plugins/start
ln -s ~cs2030s/.vim/vim-plugins/lightline/ .vim/pack/plugins/start
```

<br>

Then:

1. Copy `.vimrc.regcondensed.vim` to `.vimrc`
2. Run replace commands at top of file
3. _**(optional)**_ Copy `.text_editor_like_selection.regcondensed.vim` to `.vimrc` & follow the instructions at the top of file

<br><br>

## Differences from `master`:

### Removed features:

- Template loading for new `.java` files
- `[Ctrl + /]` Comment/Uncomment
- `mainfn`, `println`, `printf` abbreviations
- `[Ctrl + B]` Vertical diff split
