# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias brasdor="ssh tdunn@brasdor.ace-net.ca"
alias fundy="ssh tdunn@fundy.ace-net.ca"
alias placentia="ssh tdunn@placentia.ace-net.ca"
alias glooscap="ssh tdunn@glooscap.ace-net.ca"
alias mkdir="mkdir -p"
alias ll="ls -lG"
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
alias work="cd ~/workspace"
alias music="cd ~/Music/iTunes/iTunes\ Media/Music"
alias nfiles="ls -1 | wc -l"
alias dot="cd ~/.dotfiles"
alias dl="cd ~/Downloads"
alias docs="cd ~/Documents"
alias dropbox="cd ~/Documents/Dropbox"
alias reload=". ~/.zshrc"
alias mybook="cd /Volumes/My\ Book"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Fixed a problem with tmux window renaming, see:
# http://superuser.com/questions/306028/tmux-and-zsh-custom-prompt-bug-with-window-name
DISABLE_AUTO_TITLE=true

# Installing python
# http://docs.python-guide.org/en/latest/starting/install/osx.html
export PATH=/usr/local/bin:$PATH

# Powerline Zsh
# . {repository_root}/powerline/bindings/zsh/powerline.zsh

function nlines() {
  cat $1 | wc -l
}

function toBrasdor() {
  scp -r $1 tdunn@brasdor.ace-net.ca:~/$2
}

function fromBrasdor() {
  scp -r tdunn@brasdor.ace-net.ca:~/$1 $2
}

function toGlooscap() {
  scp -r $1 tdunn@glooscap.ace-net.ca:~/$2
}

function fromGlooscap() {
  scp -r tdunn@glooscap.ace-net.ca:~/$1 $2
}

function toFundy() {
  scp -r $1 tdunn@fundy.ace-net.ca:~/$2
}

function fromFundy() {
  scp -r tdunn@fundy.ace-net.ca:~/$1 $2
}

function toPlacentia() {
  scp -r $1 tdunn@placentia.ace-net.ca:~/$2
}

function fromPlacentia() {
  scp -r tdunn@placentia.ace-net.ca:~/$1 $2
}

