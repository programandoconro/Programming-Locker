# aliases
alias develop='git checkout develop'
alias test-unit-all='npm run test:unit -- --all'
alias amend='git commit --amend'

pushini () {
    branchName=`git branch --contains | grep '*' | awk '{print $2}'`
    echo "branchName: $branchName"
    echo "git push --set-upstream origin $branchName"
    echo "continue?"
    read
    git push --set-upstream origin $branchName
}

# utils
function peco-history-selection() {
    BUFFER=`history 1 | tac | sed s/\^\ \*\[0-9\]\*//g | sed s/\^\*//g | sed s/\^\ \*//g | peco `
    CURSOR=$#BUFFER zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-git-checkout() {
    BUFFER=`git branch -a | cat | sed s/\^\ \*\[0-9\]\*//g | sed s/\^\*//g | sed s/\^\ \*//g | awk '{print "git checkout " $0}' | sed s/remotes// | sed s/origin// | sed s'/\/\///' |  peco`
    CURSOR=$#BUFFER zle reset-prompt
}
zle -N peco-git-checkout
bindkey '^L' peco-git-checkout
