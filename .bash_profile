export PATH=/usr/local/bin:$PATH
export PGDATA="/usr/local/var/postgres"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:`yarn global bin`"
[ -s "/Users/jacobr/nvm.sh" ] && \. "/Users/jacobr/.nvm/nvm.sh"  # This loads nvm
[ -s "/Users/jacobr/.nvm/bash_completion" ] && \. "/Users/jacobr/.nvm/bash_completion"  # This loads nvm bash_completion

set -o vi   ### standardizes entry about terminal
alias l='ls -lah'  ##custom list directory

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# List all files colorized in long format
# alias l="ls -lFG"

# List all files colorized in long format, including dot files
alias la="ls -laFG"

# List only directories
alias lsd="ls -lFG | grep --color=never '^d'"

# Always use color output for `ls`
alias ls="command ls -G"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

### GIT ###
alias gpo="git push origin"
alias gckm="git checkout master"
alias gac="git add .; git commit -m"
alias gp="git pull"
alias grao="git remote add origin"
alias gc='git clone'
alias gck='git checkout'
alias dev='git checkout dev'

### DEV TOOLS ###
alias nmon="nodemon ./server/app.js"
alias nbug="node-debug ./server/app.js"

alias bash='atom ~/.bash_profile'
alias gitignore='atom ~/.gitignore_global'
alias rbash='source ~/.bash_profile'

#### CHROME URLS ####
alias st='chrome "http://primeacademy.io/student"'
alias khub='chrome https://github.com/kdszafranski?tab=repositories'
alias jhub='chrome "https://github.com/JakeIwen?tab=repositories"'
alias lhub='chrome "https://github.com/LukeSchlangen?tab=repositories"'
alias phub='chrome "https://github.com/primeacademy?tab=repositories"'

### APPLICATIONS ###
alias n='open -a notes'
alias am='open -a Activity\ Monitor'
alias at='open -a Automator'
alias fbm='open -a Messenger'
alias slk='open -a Slack'
alias chrome='open -a Google\ Chrome'

### Sleep Display ###
alias slp='pmset displaysleepnow'

### Directory navigation ###
alias sig='cd /Users/jacobr/Desktop/Google\ Drive/PRIME/sigma'
alias a='sig; atom .'
alias gtr='sig; cd guitar-chord-generator/; atom .'
alias drive='cd /Users/jacobr/Desktop/Google\ Drive'
alias osig='open /Users/jacobr/Desktop/Google\ Drive/PRIME/sigma'
alias odrive='open /Users/jacobr/Desktop/Google\ Drive'
alias dl='open /Users/jacobr/Downloads'
alias apps='open /Applications'
alias solo="cd /Users/jacobr/Desktop/Google\ Drive/PRIME/sigma/solo-project/gtr-tool/server/public/"
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

### Copy local internet pw to clipboard ###
alias w='echo wyncq9mu | pbcopy'
alias webd='mkdir {public,server}; mkdir public/{styles,scripts,views,vendor}; mkdir server/{routes,modules,}'
alias pg='postgres -D /usr/local/var/postgres'

### Custom Bash Prompt - http://xta.github.io/HalloweenBash/ ###
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1=" \[\033[01;31m\]\u@\h:\[\033[01;32m\]\$(parse_git_branch) \[\033[01;32m\]\w \[\033[01;34m\]\n$ \[\e[0m\]"


mstmrg() {
  gac "$2"
  git push
  git checkout dev
  git pull
  git merge "$1"
  git push
  git checkout test0
  git pull
  git merge dev
  git push
  gck dev
  git merge test0
}

devmrg() {
  git pull
  gac "$1"
  git push
  git checkout test0
  git pull
  git merge dev
  git push
  gck dev
  git merge test0
}

source ~/.git-completion.bash
