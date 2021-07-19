# Shortcuts
alias reloadshell="exec zsh"

# Directories
alias dotfiles="cd $DOTFILES"
alias projects="cd $HOME/Projects"

# Docker
alias dbuild="docker build . -t"
alias dcup="docker-compose up -d"

# SQL Server
alias mssql=""

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias commit="git add . && git commit -m"
alias nuke="git clean -df && git reset --hard"
alias pull="git pull"
alias push="git push"