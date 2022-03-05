stty -ixon
bind tab:menu-complete
bind c-h:backward-kill-word
bind -x '"\C-t":vim .'
fignore='.class'

alias cd..='cd ..'
alias cd..2='cd ../..'
alias cd..3='cd ../../..'
alias cd..4='cd ../../../..'
alias cd..5='cd ../../../../..'

alias vim.='vim .'
alias vim,='vim .'
alias vim,.='vim .'
alias vim.,='vim .'

alias ls='ls -1'

alias reloadbash='source ~/.bash_profile; bind -f ~/.inputrc'

alias javaca='javac *.java'
alias checkstyle='java -jar ~cs2030s/bin/checkstyle.jar -c ~cs2030s/bin/cs2030_checks.xml *.java'
