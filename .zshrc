export ZSH=/home/sunho/.oh-my-zsh

# zsh
plugins=(git git-flow brew history node npm kubectl)
ZSH_THEME="agnoster"

# minus cd
setopt AUTO_PUSHD
setopt PUSHD_MINUS
setopt CDABLE_VARS
autoload -U compinit && compinit
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12'

# kubectl
alias k="kubectl"
source <(kubectl completion zsh)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# c
export CC=/opt/rh/devtoolset-7/root/usr/bin/gcc
export CPP=/opt/rh/devtoolset-7/root/usr/bin/cpp
export CXX=/opt/rh/devtoolset-7/root/usr/bin/g++
export PATH=/opt/rh/devtoolset-7/root/usr/bin:$PATH
export PATH=/opt/rh/llvm-toolset-7/root/usr/bin:$PATH

# go
export GO111MODULE=on
export GOROOT=/usr/local/go
export GOPATH=/home/sunho/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

source $ZSH/oh-my-zsh.sh
