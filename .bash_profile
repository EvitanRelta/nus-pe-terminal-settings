stty -ixon

alias cd..='cd ..'
alias cd..2='cd ../..'
alias cd..3='cd ../../..'
alias cd..4='cd ../../../..'
alias cd..5='cd ../../../../..'

alias javaca='javac *.java'
alias checkstyle='java -jar ~cs2030s/bin/checkstyle.jar -c ~cs2030s/bin/cs2030_checks.xml *.java'
alias test='./test.sh $(find . -type f -name "Lab*.java" | cut -f 2 -d "/" | cut -f 1 -d ".")'
